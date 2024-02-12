part of '../../../runes/fantasy_country_conceiver.dart';

class Service extends ServiceBase with ServiceMix {
  @override
  String get name => 'Fantasy Country Conceiver';

  @override
  Future<TextResponse> conceivingDescriptionCountry(
    grpc.ServiceCall call,
    PromptRequest request,
  ) async {
    // TODO: implement conceivingDescriptionCountry
    throw UnimplementedError();
  }

  @override
  Future<ImageResponse> conceivingImageFirstPlaceCountry(
    grpc.ServiceCall call,
    PromptRequest request,
  ) async {
    // TODO: implement conceivingImageFirstPlaceCountry
    throw UnimplementedError();
  }

  @override
  Future<JsonResponse> conceivingNameAndIdCountry(
    grpc.ServiceCall call,
    PromptRequest request,
  ) async {
    maia.logiRequest(call, request);

    final name = _genNames.next;
    final response = JsonResponse(
      json: {
        'hid': genHid(name.title),
        'uid': genPlanUid,
        'title': name.title,
        if (name.synopsis != null) 'synopsis': name.synopsis!,
      },
      answer: ServerAnswer(
        session: request.session,
        type: maia.ServerAnswerTypeEnum.ACCEPTED_SERVER_ANSWER_TYPE,
      ),
    );

    maia.logiResponse(call, response);

    return response;
  }

  static final _genNames = Names.fantasyCountries();
}
