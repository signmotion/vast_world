part of '../../../vast_world_maia.dart';

class ServerService extends ServiceBase with ServiceMix {
  @override
  String get name => 'Maia';

  @override
  Future<ClaimSessionResponse> claimSession(
    ServiceCall call,
    ClaimSessionRequest request,
  ) async {
    logiRequest(call, request);

    final response = ClaimSessionResponse(
      issuedSession: await serverLive.claimSession(
        uidDevice: request.uidDevice,
      ),
    );

    logiResponse(call, response);

    return response;
  }

  @override
  Future<ApproveSessionResponse> approveSession(
    ServiceCall call,
    ApproveSessionRequest request,
  ) async {
    logiRequest(call, request);

    final response = ApproveSessionResponse(
      approved: await serverLive.approveSession(session: request.session),
    );

    logiResponse(call, response);

    return response;
  }

  @override
  Future<GetAboutServerResponse> getAboutServer(
    ServiceCall call,
    GetAboutServerRequest request,
  ) async {
    logiRequest(call, request);

    final response = GetAboutServerResponse(name: '$server');

    logiResponse(call, response);

    return response;
  }

  @override
  Stream<ActBaseResponse> synchronize(
    ServiceCall call,
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

        late final bool success;
        try {
          success = await serverLive.processingActOnLoreSession(
            session: ar.session,
            actBase: ar.act,
          );
        } catch (ex) {
          loge(ex);
          success = false;
        }

        // TODO(sign): optimize Don't send the act, only type or uid of the act.
        final answer = ActBaseResponse(
          session: ar.session,
          act: ar.act,
          answer: success
              ? ServerAnswerTypeEnum.ACCEPTED_SERVER_ANSWER_TYPE
              : ServerAnswerTypeEnum.REJECTED_SERVER_ANSWER_TYPE,
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
