part of '../../../vast_world_hermes.dart';

final _emptyState = ClientState(
  ss: ClientStateBase(),
  u: Universe(),
  lore: Lore(),
);

class DefaultClientBloc extends HydratedBloc<AClientEvent, ClientState> {
  DefaultClientBloc({
    required this.serverHost,
    required this.serverPort,
  })  : loreInfluencer = const LoreInfluencer(),
        super(_emptyState) {
    on<AClientEvent>(
      _onEvent,
      transformer: sequential(),
    );
  }

  final String serverHost;
  final int serverPort;

  final LoreInfluencer loreInfluencer;

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
        InitializingClientEvent e => _onInitEvent(e, emit),
        InitializingMaiaClientEvent e => _onInitializingMaiaEvent(e, emit),
        RegisteringClientEvent e => _onRegisteringClientEvent(e, emit),
        ClaimingSessionClientEvent e => _onClaimingSessionEvent(e, emit),
        ApprovingSessionClientEvent e => _onApprovingSessionEvent(e, emit),
        GettingAboutServerClientEvent e => _onGettingAboutServerEvent(e, emit),
        OpeningSyncStreamsClientEvent e => _onOpeningSyncStreamsEvent(e, emit),
        WaitingInputClientEvent e => _onWaitingInputEvent(e, emit),
        SendingToServerActClientEvent e => _onSendingToServerActEvent(e, emit),
        ProcessingActClientEvent e => _onProcessingOnClientActEvent(e, emit),
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
    // reset state
    emit(_emptyState);

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
    maiaStub = ServiceClient(channel);
  }

  Future<void> _onRegisteringClientEvent(
    RegisteringClientEvent event,
    Emitter<ClientState> emit,
  ) async {
    final device = await uidDevice;
    logi('Registering a client for device `$device`...');

    add(const ClaimingSessionClientEvent());
    add(const ApprovingSessionClientEvent());

    add(const GettingAboutServerClientEvent());

    add(const OpeningSyncStreamsClientEvent());
  }

  Future<void> _onClaimingSessionEvent(
    ClaimingSessionClientEvent event,
    Emitter<ClientState> emit,
  ) async {
    final device = await uidDevice;
    logi('Claiming a session for the device `$device`...');

    state.ss.freeze();
    emit(
      state.copyWith(
        ss: state.ss.rebuild((v) {
          v.state = ClientStateEnum.CLAIMING_SESSION_CLIENT_STATE;
          v.uidDevice = device;
        }),
      ),
    );

    final response = await maiaStub.claimSession(
      ClaimSessionRequest(uidDevice: device),
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

    logi('Session `$session` claimed for the device `$device`.');
  }

  Future<void> _onApprovingSessionEvent(
    ApprovingSessionClientEvent event,
    Emitter<ClientState> emit,
  ) async {
    final device = await uidDevice;
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
        uidDevice: device,
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
  late final ResponseStream<ActBaseResponse> serverActs;

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
        final act = const ActBuilder().fromBase(ar.act);
        logi('Processing the received act from Server.'
            ' `${ar.act.type.name}` -> `$act`');

        add(ProcessingActClientEvent(act: act, answer: ar.answer));
      },
      onError: (dynamic s) =>
          loge('_onOpeningSyncStreamsEvent() serverActs onError `$s`'),
      onDone: () => logi('_onOpeningSyncStreamsEvent() serverActs onDone'),
    );
    logi('A stream from Server to Client opened.');

    add(const WaitingInputClientEvent());
  }

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
          lore: loreInfluencer.processing(state.u, state.lore, event.act),
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

  void _checkApprove() {
    if (!state.ss.sessionApproved) {
      throw maia.NotApprovedSessionError(state.ss.session);
    }
  }

  String? _uidDevice;
  Future<String> get uidDevice async => _uidDevice ??=
      (await PlatformDeviceId.getDeviceId) ?? 'D-$randomPositiveInt';

  ClientChannel? _channel;
  ClientChannel get channel => _channel ??= ClientChannel(
        serverHost,
        port: serverPort,
        options: const ChannelOptions(
          credentials: ChannelCredentials.insecure(),
        ),
      );

  late final maia.ServiceClient maiaStub;

  void logi(Object msg) => logi(_logToState(LogType.info, msg));

  void logw(Object msg) => logw(_logToState(LogType.warning, msg));

  void loge(Object msg) => loge(_logToState(LogType.error, msg));

  String _logToState(LogType type, Object msg) {
    // TODO ?

    return msg.toString();
  }

  @override
  ClientState fromJson(JsonMap json) => ClientState.fromJson(json);

  @override
  JsonMap toJson(ClientState state) => state.toJson();
}
