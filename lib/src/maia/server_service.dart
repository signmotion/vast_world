part of '../../../vast_world_maia.dart';

class ServerService extends ServiceBase with ServiceMix {
  ServerService(this.server) : live = constructServerLive();

  /// This service requires an access to server.
  final NativeServer server;

  final ServerLive live;

  @override
  String get name => 'Maia';

  @override
  Future<ClaimSessionResponse> claimSession(
    grpc.ServiceCall call,
    ClaimSessionRequest request,
  ) async {
    logiRequest(call, request);

    final session = await live.claimSession(
      fixedSession: request.fixedSession,
      uidDevice: request.uidDevice,
      options: request.options,
    );
    final response = ClaimSessionResponse(issuedSession: session);

    logiResponse(call, response);

    return response;
  }

  @override
  Future<ApproveSessionResponse> approveSession(
    grpc.ServiceCall call,
    ApproveSessionRequest request,
  ) async {
    logiRequest(call, request);

    final response = ApproveSessionResponse(
      approved: await live.approveSession(session: request.session),
    );

    logiResponse(call, response);

    return response;
  }

  @override
  Future<GetAboutServerResponse> getAboutServer(
    grpc.ServiceCall call,
    GetAboutServerRequest request,
  ) async {
    logiRequest(call, request);

    final response = GetAboutServerResponse(name: '$server');

    logiResponse(call, response);

    return response;
  }

  @override
  Future<FetchPlanIdsResponse> fetchPlanIds(
    grpc.ServiceCall call,
    FetchPlanIdsRequest request,
  ) async {
    logiRequest(call, request);

    late final FetchPlanIdsResponse response;
    try {
      response = FetchPlanIdsResponse(
        planIds: await live.fetchPlanIds(session: request.session),
        answer: ServerAnswer(
          type: ServerAnswerTypeEnum.ACCEPTED_SERVER_ANSWER_TYPE,
        ),
      );
    } catch (ex) {
      loge(ex);
      response = FetchPlanIdsResponse(
        answer: ServerAnswer(
          type: ServerAnswerTypeEnum.REJECTED_SERVER_ANSWER_TYPE,
          codeExplain: ex is Error
              ? ex.code
              : ErrorExplainEnum.UNSPECIFIED_ERROR_EXPLAIN,
          messageExplain: '$ex',
        ),
      );
    }

    logiResponse(call, response);

    return response;
  }

  @override
  Future<FetchPlanResponse> fetchPlan(
    grpc.ServiceCall call,
    FetchPlanRequest request,
  ) async {
    logiRequest(call, request);

    late final FetchPlanResponse response;
    try {
      response = FetchPlanResponse(
        plan: await live.fetchPlan(
          session: request.session,
          planId: request.planId,
        ),
        answer: ServerAnswer(
          type: ServerAnswerTypeEnum.ACCEPTED_SERVER_ANSWER_TYPE,
        ),
      );
    } catch (ex) {
      loge(ex);
      response = FetchPlanResponse(
        answer: ServerAnswer(
          type: ServerAnswerTypeEnum.REJECTED_SERVER_ANSWER_TYPE,
          codeExplain: ex is Error
              ? ex.code
              : ErrorExplainEnum.UNSPECIFIED_ERROR_EXPLAIN,
          messageExplain: '$ex',
        ),
      );
    }

    logiResponse(call, response);

    return response;
  }

  @override
  Future<SetCurrentPlanResponse> setCurrentPlan(
    grpc.ServiceCall call,
    SetCurrentPlanRequest request,
  ) async {
    logiRequest(call, request);

    late final SetCurrentPlanResponse response;
    try {
      response = SetCurrentPlanResponse(
        answer: ServerAnswer(
          type: ServerAnswerTypeEnum.ACCEPTED_SERVER_ANSWER_TYPE,
        ),
      );
    } catch (ex) {
      loge(ex);
      response = SetCurrentPlanResponse(
        answer: ServerAnswer(
          type: ServerAnswerTypeEnum.REJECTED_SERVER_ANSWER_TYPE,
          codeExplain: ex is Error
              ? ex.code
              : ErrorExplainEnum.UNSPECIFIED_ERROR_EXPLAIN,
          messageExplain: '$ex',
        ),
      );
    }

    logiResponse(call, response);

    return response;
  }

  @override
  Stream<ActBaseResponse> synchronize(
    grpc.ServiceCall call,
    // ignore: avoid_renaming_method_parameters
    Stream<ActBaseRequest> clientActs,
  ) {
    logi('Opening streams between Client and Server...');

    /// create a stream for sending acts to Client
    /// the Client will be subsribe to [serverActs] below
    final serverActs = StreamController<ActBaseResponse>();

    clientActs.listen(
      (ActBaseRequest ar) async {
        logi('Processing the received act from Client.'
            ' `${ar.act.type.name}`');

        late final Object? exception;
        late final bool success;
        try {
          success = await live.processingActOnLoreSession(
            session: ar.session,
            actBase: ar.act,
          );
          exception = null;
        } catch (ex) {
          loge(ex);
          exception = ex;
          success = false;
        }

        // TODO(sign): optimize Don't send the act, only type or uid of the act.
        final answer = ActBaseResponse(
          act: ar.act,
          answer: success
              ? ServerAnswer(
                  session: ar.session,
                  type: ServerAnswerTypeEnum.ACCEPTED_SERVER_ANSWER_TYPE,
                )
              : ServerAnswer(
                  session: ar.session,
                  type: ServerAnswerTypeEnum.REJECTED_SERVER_ANSWER_TYPE,
                  codeExplain: ErrorExplainEnumBase.UNSPECIFIED_ERROR_EXPLAIN,
                  messageExplain: '$exception',
                ),
        );
        serverActs.sink.add(answer);
      },
      onError: (dynamic s) => loge('synchronize() clientActs onError `$s`'),
      onDone: () => logi('synchronize() clientActs onDone'),
    );

    logi('Opened streams between Client and Server.');

    return serverActs.stream;
  }
}
