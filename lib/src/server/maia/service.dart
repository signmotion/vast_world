part of '../../../vast_world_server.dart';

class Service extends ServiceBase with ServiceMix {
  @override
  String get name => 'Maia';

  @override
  Future<ClaimSessionResponse> claimSession(
    ServiceCall call,
    ClaimSessionRequest request,
  ) async {
    logiRequest(call, request);

    final response = ClaimSessionResponse(
      issuedSession: await live.claimSession(
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
      approved: await live.approveSession(session: request.session),
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
    Stream<ActBaseRequest> request,
  ) {
    logi('Opening streams between Client and Server...');

    /// create a stream for sending acts to Client
    /// the Client will be subsribe to [serverActs] below
    final serverActs = StreamController<ActBaseResponse>();

    request.listen(
      (ActBaseRequest ar) async {
        logi('Processing the received act from Client.'
            ' `${ar.act.type.name}`');

        late final ActBaseResponse answer;
        try {
          final success = await live.processingActOnLoreSession(
            session: ar.session,
            actBase: ar.act,
          );
          answer = ActBaseResponse(
            session: ar.session,
            act: ar.act,
            answer: success
                ? AnswerTypeEnum.ACCEPTED_ANSWER_TYPE
                : AnswerTypeEnum.REJECTED_ANSWER_TYPE,
          );
        } catch (ex) {
          loge(ex);
        }

        serverActs.sink.add(answer);
      },
      onError: (dynamic s) => loge('synchronize() clientActs onError `$s`'),
      onDone: () => logi('synchronize() clientActs onDone'),
    );

    logi('Opened streams between Client and Server.');

    return serverActs.stream;
  }
}
