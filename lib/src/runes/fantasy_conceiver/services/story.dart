part of '../../../../runes/fantasy_conceiver.dart';

class StoryService extends StoryServiceBase with ServiceMix {
  StoryService(this.server);

  /// This service requires an access to server.
  final NativeServer server;

  @override
  String get name => 'Story - Fantasy Conceiver';

  @override
  Future<ConceiveNameAndIdStoryResponse> conceiveNameAndId(
    grpc.ServiceCall call,
    maia.PromptRequest request,
  ) async {
    maia.logiRequest(call, request);

    // respect an each session
    final gen = gensNameAndIdStory.update(
      request.session,
      (gen) => gen,
      ifAbsent: () => NameAndIdStoryAiGen(
        fake: server.options(request.session).fakeData,
      ),
    );
    final d = gen.next!;

    final response = ConceiveNameAndIdStoryResponse(
      data: d,
      answer: ServerAnswer(
        session: request.session,
        type: maia.ServerAnswerTypeEnum.ACCEPTED_SERVER_ANSWER_TYPE,
      ),
    );

    maia.logiResponse(call, response);

    return response;
  }

  final gensNameAndIdStory = <String, NameAndIdStoryAiGen>{};
}
