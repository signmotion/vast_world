part of '../../../vast_world_hermes.dart';

class DefaultClientBloc extends HydratedBloc<AClientEvent, ClientState> {
  DefaultClientBloc({
    required this.serverHost,
    required this.serverPort,
    required ClientState state,
  })  : assert(state.ss.uidDevice.isNotEmpty),
        assert(serverHost.isNotEmpty),
        assert(serverPort > 0),
        super(state) {
    on<AClientEvent>(
      _onEvent,
      transformer: sequential(),
    );

    logi('$runtimeType created with state `$state`.');
  }

  final String serverHost;
  final int serverPort;

  String get uidDevice => state.ss.uidDevice;

  Universe get u => state.u;

  LoreInfluencer get loreInfluencer => state.loreInfluencer;

  /// Override this method for catching own events.
  Future<void> onExtendedEvent(
    AClientEvent event,
    Emitter<ClientState> emit,
  ) async =>
      throw UnsupportedError('Event: $event');

  /// See [onExtendedEvent].
  Future<void> _onEvent(
    AClientEvent event,
    Emitter<ClientState> emit,
  ) async {
    logi('🥏 $event'.replaceFirst('Event', ''));

    try {
      return switch (event) {
        // initializing events
        InitializingClientEvent e => _onInitEvent(e, emit),
        InitializingMaiaClientEvent e => _onInitializingMaiaEvent(e, emit),
        RegisteringClientEvent e => _onRegisteringClientEvent(e, emit),
        ClaimingSessionClientEvent e => _onClaimingSessionEvent(e, emit),
        ApprovingSessionClientEvent e => _onApprovingSessionEvent(e, emit),
        GettingAboutServerClientEvent e => _onGettingAboutServerEvent(e, emit),
        OpeningSyncStreamsClientEvent e => _onOpeningSyncStreamsEvent(e, emit),
        SuccessInitClientEvent e => _onSuccessInitEvent(e, emit),
        FailureInitClientEvent e => _onFailureInitEvent(e, emit),
        WaitingInputClientEvent e => _onWaitingInputEvent(e, emit),
        // act events
        ProcessingActClientEvent e => _onProcessingOnClientActEvent(e, emit),
        SendingToServerActClientEvent e => _onSendingToServerActEvent(e, emit),
        // unsupported event
        AClientEvent e => onExtendedEvent(e, emit),
      };
    } catch (ex) {
      loge(ex);
      add(const WaitingInputClientEvent());
    }
  }

  Future<void> _onInitEvent(
    InitializingClientEvent event,
    Emitter<ClientState> emit,
  ) async {
    logi('🐣 Opening a connection to server'
        ' $serverHost:$serverPort.'
        ' Waiting answer...');

    add(const InitializingMaiaClientEvent());
    add(const RegisteringClientEvent());
  }

  Future<void> _onInitializingMaiaEvent(
    InitializingMaiaClientEvent event,
    Emitter<ClientState> emit,
  ) async {
    maiaStub = maia.ServiceClient(channel);
  }

  Future<void> _onRegisteringClientEvent(
    RegisteringClientEvent event,
    Emitter<ClientState> emit,
  ) async {
    logi('Registering a client for device `$uidDevice`...');

    add(const ClaimingSessionClientEvent());
    add(const ApprovingSessionClientEvent());

    add(const GettingAboutServerClientEvent());

    add(const OpeningSyncStreamsClientEvent());
  }

  Future<void> _onClaimingSessionEvent(
    ClaimingSessionClientEvent event,
    Emitter<ClientState> emit,
  ) async {
    logi('Claiming a session for the device `$uidDevice`...');

    state.ss.freeze();
    emit(
      state.copyWith(
        ss: state.ss.rebuild((v) {
          v.state = ClientStateEnum.CLAIMING_SESSION_CLIENT_STATE;
          v.uidDevice = uidDevice;
        }),
      ),
    );

    final response = await maiaStub.claimSession(
      ClaimSessionRequest(uidDevice: uidDevice),
    );
    final session = response.issuedSession;

    emit(
      state.copyWith(
        ss: state.ss.rebuild((v) {
          v.state = ClientStateEnum.CLAIMED_SESSION_CLIENT_STATE;
          v.session = session;
        }),
      ),
    );

    logi('Session `$session` claimed for the device `$uidDevice`.');
  }

  Future<void> _onApprovingSessionEvent(
    ApprovingSessionClientEvent event,
    Emitter<ClientState> emit,
  ) async {
    final session = state.ss.session;
    logi('Approving the session `$session`...');

    state.ss.freeze();
    emit(
      state.copyWith(
        ss: state.ss.rebuild((v) {
          v.state = ClientStateEnum.APPROVING_SESSION_CLIENT_STATE;
        }),
      ),
    );

    final response = await maiaStub.approveSession(
      ApproveSessionRequest(
        uidDevice: uidDevice,
        session: session,
      ),
    );
    if (!response.approved) {
      throw maia.NotApprovedSessionError(session);
    }

    emit(
      state.copyWith(
        ss: state.ss.rebuild((v) {
          v.state = ClientStateEnum.APPROVED_SESSION_CLIENT_STATE;
          v.sessionApproved = true;
        }),
      ),
    );

    logi('Session `$session` approved.');
  }

  Future<void> _onGettingAboutServerEvent(
    GettingAboutServerClientEvent event,
    Emitter<ClientState> emit,
  ) async {
    _checkApprove();

    logi('Getting info about server...');

    state.ss.freeze();
    emit(
      state.copyWith(
        ss: state.ss.rebuild((v) {
          v.state = ClientStateEnum.GETTING_ABOUT_SERVER_CLIENT_STATE;
        }),
      ),
    );

    final response = await maiaStub.getAboutServer(
      maia.GetAboutServerRequest(
        session: state.ss.session,
      ),
    );
    final name = response.name;

    emit(
      state.copyWith(
        ss: state.ss.rebuild((v) {
          v.state = ClientStateEnum.GOT_ABOUT_SERVER_CLIENT_STATE;
          v.nameServer = name;
        }),
      ),
    );

    logi('About server: `$name`.');
  }

  late final StreamController<ActBaseRequest> clientActs;
  late final grpc.ResponseStream<ActBaseResponse> serverActs;

  Future<void> _onOpeningSyncStreamsEvent(
    OpeningSyncStreamsClientEvent event,
    Emitter<ClientState> emit,
  ) async {
    state.ss.freeze();
    emit(
      state.copyWith(
        ss: state.ss.rebuild((v) {
          v.state = ClientStateEnum.OPENNING_SYNC_STREAMS_CLIENT_STATE;
        }),
      ),
    );

    /// create a stream for sending acts to Server
    /// the Server will be subscribe to [clientActs] below
    clientActs = StreamController<ActBaseRequest>();
    logi('A stream from Client to Server opened.');

    serverActs = maiaStub.synchronize(clientActs.stream);
    serverActs.listen(
      (ActBaseResponse ar) {
        final act = NativeActBuilder(state.componentBuilder).fromBase(ar.act);
        logi('Processing the received act from Server.'
            ' `${ar.act.type.name}` -> `$act`');

        add(ProcessingActClientEvent(act: act, answer: ar.answer));
      },
      onError: (dynamic s) =>
          loge('_onOpeningSyncStreamsEvent() serverActs onError `$s`'),
      onDone: () => logi('_onOpeningSyncStreamsEvent() serverActs onDone'),
    );
    logi('A stream from Server to Client opened.');

    add(const SuccessInitClientEvent());
  }

  Future<void> _onSuccessInitEvent(
    SuccessInitClientEvent event,
    Emitter<ClientState> emit,
  ) async {
    whenSuccessInit();
    add(const WaitingInputClientEvent());
  }

  void whenSuccessInit() {}

  Future<void> _onFailureInitEvent(
    FailureInitClientEvent event,
    Emitter<ClientState> emit,
  ) async {
    whenFailureInit();
    add(const WaitingInputClientEvent());
  }

  void whenFailureInit() {}

  Future<void> _onWaitingInputEvent(
    WaitingInputClientEvent event,
    Emitter<ClientState> emit,
  ) async {
    state.ss.freeze();
    emit(
      state.copyWith(
        ss: state.ss.rebuild((v) {
          v.state = ClientStateEnum.WAITING_INPUT_CLIENT_STATE;
        }),
      ),
    );
  }

  /// Catching after [SendingToServerActEvent].
  Future<void> _onProcessingOnClientActEvent(
    ProcessingActClientEvent event,
    Emitter<ClientState> emit,
  ) async {
    if (event.answer != maia.ServerAnswerTypeEnum.ACCEPTED_SERVER_ANSWER_TYPE) {
      logw("The event `$event` doesn't accepted on the server side.");
      // TODO(sign): Respect this answer.
      return;
    }

    state.ss.freeze();
    emit(
      state.copyWith(
        ss: state.ss.rebuild((v) {
          v.state = ClientStateEnum.PROCESSING_ACT_CLIENT_STATE;
        }),
      ),
    );

    late final bool success;
    try {
      emit(
        state.copyWith(
          lore: state.loreInfluencer.processing(state.lore, event.act),
        ),
      );
      success = true;
    } catch (ex) {
      loge(ex);
      success = false;
    }

    emit(
      state.copyWith(
        ss: state.ss.rebuild((v) {
          v.state = success
              ? ClientStateEnum.PROCESSED_ACT_SUCCESS_CLIENT_STATE
              : ClientStateEnum.PROCESSED_ACT_ERROR_CLIENT_STATE;
        }),
      ),
    );

    add(const WaitingInputClientEvent());
  }

  /// Sending before [ProcessingOnServerActEvent].
  Future<void> _onSendingToServerActEvent(
    SendingToServerActClientEvent event,
    Emitter<ClientState> emit,
  ) async {
    _checkApprove();

    state.ss.freeze();
    emit(
      state.copyWith(
        ss: state.ss.rebuild((v) {
          v.state = ClientStateEnum.SENDING_ACT_CLIENT_STATE;
        }),
      ),
    );

    late final bool success;
    try {
      final request =
          ActBaseRequest(session: state.ss.session, act: event.act.base);
      clientActs.sink.add(request);
      success = true;
    } catch (ex) {
      loge(ex);
      success = false;
    }

    emit(
      state.copyWith(
        ss: state.ss.rebuild((v) {
          v.state = success
              ? ClientStateEnum.SENT_ACT_SUCCESS_CLIENT_STATE
              : ClientStateEnum.SENT_ACT_ERROR_CLIENT_STATE;
        }),
      ),
    );

    add(const WaitingInputClientEvent());
  }

  void _checkApprove() {
    if (!state.ss.sessionApproved) {
      throw maia.NotApprovedSessionError(state.ss.session);
    }
  }

  grpc.ClientChannel? _channel;
  grpc.ClientChannel get channel => _channel ??= grpc.ClientChannel(
        serverHost,
        port: serverPort,
        options: const grpc.ChannelOptions(
          credentials: grpc.ChannelCredentials.insecure(),
        ),
      );

  late final maia.ServiceClient maiaStub;

  void logi(Object msg) => dh.logi(_logToState(dh.LogType.info, msg));

  void logw(Object msg) => dh.logw(_logToState(dh.LogType.warning, msg));

  void loge(Object msg) => dh.loge(_logToState(dh.LogType.error, msg));

  String _logToState(dh.LogType type, Object msg) {
    // TODO ?

    return msg.toString();
  }

  @override
  ClientState fromJson(JsonMap json) => state.fromJson(json);

  @override
  JsonMap toJson(ClientState state) => state.toJson();
}
