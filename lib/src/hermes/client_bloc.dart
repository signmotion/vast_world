part of '../../../vast_world_hermes.dart';

class DefaultClientBloc extends HydratedBloc<AClientEvent, ClientState> {
  DefaultClientBloc({
    required this.serverHost,
    required this.serverPort,
    required this.serverOptions,
    required this.fixedSession,
    required ClientState state,
  })  : assert(serverOptions.isInitialized(),
            'The server options should be defined.'),
        assert(state.ss.uidDevice.isNotEmpty),
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
  final maia.ServerOptions serverOptions;
  final bool fixedSession;

  String get uidDevice => state.ss.uidDevice;

  Universe get u => state.u;

  NativePlanBuilder get buildPlan =>
      state.planBuilder(u, state.componentBuilder);

  LoreInfluencer get loreInfluencer => state.loreInfluencer;

  /// Override this method for catching own events.
  Future<void> onExtended(
    AClientEvent event,
    Emitter<ClientState> emit,
  ) async =>
      throw UnsupportedError('Event: $event');

  /// See [onExtended].
  Future<void> _onEvent(
    AClientEvent event,
    Emitter<ClientState> emit,
  ) async {
    logi('$event');

    try {
      return switch (event) {
        // initializing events
        InitializingClientEvent e => _onInit(e, emit),
        InitializingMaiaClientEvent e => _onInitializingMaia(e, emit),
        RegisteringClientEvent e => _onRegisteringClient(e, emit),
        ClaimingSessionClientEvent e => _onClaimingSession(e, emit),
        ApprovingSessionClientEvent e => _onApprovingSession(e, emit),
        GettingAboutServerClientEvent e => _onGettingAboutServer(e, emit),
        SuccessInitClientEvent e => _onSuccessInit(e, emit),
        FailureInitClientEvent e => _onFailureInit(e, emit),
        WaitingInputClientEvent e => _onWaitingInput(e, emit),
        // act events
        OpeningSyncStreamsClientEvent e => _onOpeningSyncStreams(e, emit),
        ConstructingPlanClientEvent e => _onConstructingPlan(e, emit),
        ConstructingAndFetchingPlanClientEvent e =>
          _onConstructingAndFetchingPlan(e, emit),
        ConstructingPlanWhenAbsentClientEvent e =>
          _onConstructingPlanWhenAbsent(e, emit),
        ConstructingWhenAbsentAndFetchingPlanClientEvent e =>
          _onConstructingWhenAbsentAndFetchingPlan(e, emit),
        FetchingPlanClientEvent e => _onFetchingPlan(e, emit),
        SettingCurrentPlanIdClientEvent e => _onSettingCurrentPlanId(e, emit),
        ProcessingActClientEvent e => _onProcessingOnClientAct(e, emit),
        SendingToServerActClientEvent e => _onSendingToServerAct(e, emit),
        // unsupported event
        AClientEvent e => onExtended(e, emit),
      };
    } catch (ex) {
      loge(ex);
      add(const WaitingInputClientEvent(from: '_onEvent'));
    }
  }

  Future<void> _onInit(
    InitializingClientEvent event,
    Emitter<ClientState> emit,
  ) async {
    logi('🐣 Opening a connection to server'
        ' $serverHost:$serverPort.'
        ' Waiting answer...');

    add(const InitializingMaiaClientEvent());
    add(const RegisteringClientEvent());
  }

  Future<void> _onInitializingMaia(
    InitializingMaiaClientEvent event,
    Emitter<ClientState> emit,
  ) async {
    maiaStub = maia.ServiceClient(channel);
  }

  Future<void> _onRegisteringClient(
    RegisteringClientEvent event,
    Emitter<ClientState> emit,
  ) async {
    logi('Registering a client for device `$uidDevice`...');

    add(const ClaimingSessionClientEvent());
    add(const ApprovingSessionClientEvent());

    add(const GettingAboutServerClientEvent());

    add(const OpeningSyncStreamsClientEvent());

    add(const SuccessInitClientEvent());
  }

  Future<void> _onClaimingSession(
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
      ClaimSessionRequest(
        fixedSession: fixedSession,
        uidDevice: uidDevice,
        options: serverOptions,
      ),
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

  Future<void> _onApprovingSession(
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
      throw maia.NotApprovedSessionError(session, StackTrace.current);
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

  Future<void> _onGettingAboutServer(
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

  Future<void> _onOpeningSyncStreams(
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
    logi('A stream Client ➡️ Server opened.');

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
    logi('A stream Server ➡️ Client opened.');
  }

  Future<void> _onFetchingPlan(
    FetchingPlanClientEvent event,
    Emitter<ClientState> emit,
  ) async {
    state.ss.freeze();
    emit(
      state.copyWith(
        ss: state.ss.rebuild((v) {
          v.state = ClientStateEnum.FETCHING_PLAN_CLIENT_STATE;
        }),
      ),
    );

    final lore = state.lore;
    final id = event.planId;
    lore.remove(id);

    logi('Fetching plan `$id` and build with `$buildPlan`...');
    final response = await maiaStub.fetchPlan(
      maia.FetchPlanRequest(
        session: state.ss.session,
        planId: id,
      ),
    );
    if (response.answer.type !=
        maia.ServerAnswerTypeEnum.ACCEPTED_SERVER_ANSWER_TYPE) {
      throw ServerAnswerError(response.answer, StackTrace.current);
    }

    final plan = buildPlan.fromBase(response.plan);
    lore.addNew(plan);
    logi('Fetched plan `$id` and added to Lore.');

    emit(
      state.copyWith(
        ss: state.ss.rebuild((v) {
          v.state = ClientStateEnum.FETCHED_PLAN_CLIENT_STATE;
        }),
        lore: lore,
      ),
    );

    logi('Fetched current plan `$id` from Server.');

    add(const WaitingInputClientEvent(from: '_onFetchingPlan'));
  }

  Future<void> _onConstructingAndFetchingPlan(
    ConstructingAndFetchingPlanClientEvent event,
    Emitter<ClientState> emit,
  ) async {
    add(ConstructingPlanClientEvent(plan: event.plan));
    add(FetchingPlanClientEvent(planId: event.plan.id));

    add(const WaitingInputClientEvent(from: '_onConstructingAndFetchingPlan'));
  }

  Future<void> _onConstructingPlan(
    ConstructingPlanClientEvent event,
    Emitter<ClientState> emit,
  ) async {
    state.ss.freeze();
    emit(
      state.copyWith(
        ss: state.ss.rebuild((v) {
          v.state = ClientStateEnum.CONSTRUCTING_PLAN_CLIENT_STATE;
        }),
      ),
    );

    final id = event.plan.id;

    logi('Constructing plan `$id` on server side...');
    {
      final response = await maiaStub.constructPlan(
        maia.ConstructPlanRequest(
          session: state.ss.session,
          plan: event.plan.base,
        ),
      );
      if (response.answer.type !=
          maia.ServerAnswerTypeEnum.ACCEPTED_SERVER_ANSWER_TYPE) {
        throw ServerAnswerError(response.answer, StackTrace.current);
      }
    }
    logi('The plan `$id` constructed on server side.');

    // ! we don't get the constructed plan here to client side

    emit(
      state.copyWith(
        ss: state.ss.rebuild((v) {
          v.state = ClientStateEnum.CONSTRUCTED_PLAN_CLIENT_STATE;
        }),
      ),
    );

    add(const WaitingInputClientEvent(from: '_onConstructingPlan'));
  }

  Future<void> _onConstructingPlanWhenAbsent(
    ConstructingPlanWhenAbsentClientEvent event,
    Emitter<ClientState> emit,
  ) async {
    if (await hasPlan(event.plan.id)) {
      return;
    }

    add(ConstructingPlanClientEvent(plan: event.plan));
  }

  Future<void> _onConstructingWhenAbsentAndFetchingPlan(
    ConstructingWhenAbsentAndFetchingPlanClientEvent event,
    Emitter<ClientState> emit,
  ) async {
    if (await hasPlan(event.plan.id)) {
      add(FetchingPlanClientEvent(planId: event.plan.id));
      return;
    }

    final act = AddPlanAct.fromPlan(event.fromPlanId, event.plan);
    logi('DefaultClientBloc _onConstructingWhenAbsentAndFetchingPlan()'
        ' Sending act $act...');
    add(SendingToServerActClientEvent(act: act));

    /* Doesn't work: the plan is absent.
    add(ConstructingPlanWhenAbsentClientEvent(plan: event.plan));
    // TODO(sign): stable optimize Without constant delayed.
    await pauseInSeconds(3);
    add(FetchingPlanClientEvent(planId: event.plan.id));
    */
  }

  Future<bool> hasPlan(String planId) async {
    logi('Checking plan `$planId` on server side...');
    late final bool has;
    {
      final response = await maiaStub.hasPlan(
        maia.HasPlanRequest(
          session: state.ss.session,
          planId: planId,
        ),
      );
      if (response.answer.type !=
          maia.ServerAnswerTypeEnum.ACCEPTED_SERVER_ANSWER_TYPE) {
        throw ServerAnswerError(response.answer, StackTrace.current);
      }
      has = response.has;
    }
    logi('The plan `$planId` ${has ? "present" : "absent"} on server side.');

    return has;
  }

  Future<void> _onSettingCurrentPlanId(
    SettingCurrentPlanIdClientEvent event,
    Emitter<ClientState> emit,
  ) async {
    state.ss.freeze();
    emit(
      state.copyWith(
        ss: state.ss.rebuild((v) {
          v.currentPlanId = event.planId;
        }),
      ),
    );

    add(const WaitingInputClientEvent(from: '_onSettingCurrentPlanId'));
  }

  Future<void> _onSuccessInit(
    SuccessInitClientEvent event,
    Emitter<ClientState> emit,
  ) async {
    whenSuccessInit();
    add(const WaitingInputClientEvent(from: '_onSuccessInit'));
  }

  void whenSuccessInit() {}

  Future<void> _onFailureInit(
    FailureInitClientEvent event,
    Emitter<ClientState> emit,
  ) async {
    whenFailureInit();
    add(const WaitingInputClientEvent(from: '_onFailureInit'));
  }

  void whenFailureInit() {}

  Future<void> _onWaitingInput(
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
  Future<void> _onProcessingOnClientAct(
    ProcessingActClientEvent event,
    Emitter<ClientState> emit,
  ) async {
    if (event.answer.type !=
        maia.ServerAnswerTypeEnum.ACCEPTED_SERVER_ANSWER_TYPE) {
      throw ServerAnswerError(event.answer, StackTrace.current);
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
          lore: state.loreInfluencer.processingOnClient(state.lore, event.act),
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

    add(const WaitingInputClientEvent(from: '_onProcessingOnClientAct'));
  }

  /// Sending before [ProcessingOnServerActEvent].
  Future<void> _onSendingToServerAct(
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

    add(const WaitingInputClientEvent(from: '_onSendingToServerAct'));
  }

  void _checkApprove() {
    if (!state.ss.sessionApproved) {
      throw maia.NotApprovedSessionError(state.ss.session, StackTrace.current);
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
