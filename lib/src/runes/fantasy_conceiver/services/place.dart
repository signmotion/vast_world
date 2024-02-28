part of '../../../../runes/fantasy_conceiver.dart';

class PlaceService extends PlaceServiceBase with ServiceMix {
  PlaceService(this.server);

  /// This service requires an access to server.
  final NativeServer server;

  @override
  String get name => 'Place - Fantasy Conceiver';

  @override
  Future<ConceiveNameAndIdPlaceResponse> conceiveNameAndId(
    grpc.ServiceCall call,
    maia.PromptRequest request,
  ) async {
    maia.logiRequest(call, request);

    // respect an each session
    final gen = gensNameAndIdPlace.update(
      request.session,
      (gen) => gen,
      ifAbsent: () => NameAndIdPlaceAiGen(
        fake: server.options(request.session).fakeData,
      ),
    );
    final d = gen.next!;

    final response = ConceiveNameAndIdPlaceResponse(
      data: d,
      answer: ServerAnswer(
        session: request.session,
        type: maia.ServerAnswerTypeEnum.ACCEPTED_SERVER_ANSWER_TYPE,
      ),
    );

    maia.logiResponse(call, response);

    return response;
  }

  @override
  Future<maia.ImageResponse> conceiveImage(
    grpc.ServiceCall call,
    maia.PromptRequest request,
  ) async {
    // TODO: implement conceiveImagePlace
    throw UnimplementedError();
  }

  final gensNameAndIdPlace = <String, NameAndIdPlaceAiGen>{};
}
