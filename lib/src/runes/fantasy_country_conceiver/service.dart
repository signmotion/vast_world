part of '../fantasy_country_conceiver.dart';

class Service extends ServiceBase with ServiceMix {
  Service() : serverLive = constructLive();

  final Live serverLive;

  @override
  String get name => 'Fantasy Country Conceiver';

  @override
  Future<TextResponse> conceivingDescriptionCountry(
    ServiceCall call,
    PromptRequest request,
  ) async {
    // TODO: implement conceivingDescriptionCountry
    throw UnimplementedError();
  }

  @override
  Future<ImageResponse> conceivingImageFirstPlaceCountry(
    ServiceCall call,
    PromptRequest request,
  ) async {
    // TODO: implement conceivingImageFirstPlaceCountry
    throw UnimplementedError();
  }

  @override
  Future<JsonResponse> conceivingNameCountry(
    ServiceCall call,
    PromptRequest request,
  ) async {
    maia.logiRequest(call, request);

    final r = _genNames.next;
    final response = JsonResponse(
      json: {'name': r.name, 'synopsis': r.synopsis ?? ''},
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
