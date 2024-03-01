part of '../../../../runes/fantasy_conceiver.dart';

class PlaceService extends PlaceServiceBase with ServiceMix {
  PlaceService(this.server);

  /// This service requires an access to server.
  final maia.NativeServer server;

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
      answer: maia.ServerAnswer(
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
    maia.logiRequest(call, request);

    // respect an each session
    final gen = gensImagePlace.update(
      request.session,
      (gen) => gen,
      ifAbsent: () => ImagePlaceAiGen(
        fake: server.options(request.session).fakeData,
      ),
    );
    final d = await gen.next!;

    final response = maia.ImageResponse(
      image: syrokomskyi.Image(
        width: d.width,
        height: d.height,
        data: d.data!.toUint8List(),
      ),
      answer: maia.ServerAnswer(
        session: request.session,
        type: maia.ServerAnswerTypeEnum.ACCEPTED_SERVER_ANSWER_TYPE,
      ),
    );

    maia.logiResponse(call, response);

    return response;
  }

  final gensNameAndIdPlace = <String, NameAndIdPlaceAiGen>{};
  final gensImagePlace = <String, ImagePlaceAiGen>{};
}
