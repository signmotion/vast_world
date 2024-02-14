part of '../../../runes/fantasy_country_conceiver.dart';

class Service extends ServiceBase with ServiceMix {
  @override
  String get name => 'Fantasy Country Conceiver';

  @override
  Future<ConceivingNameAndIdJourneyResponse> conceivingNameAndIdJourney(
    grpc.ServiceCall call,
    PromptRequest request,
  ) async {
    maia.logiRequest(call, request);

    final name = _genNames.next;
    final response = ConceivingNameAndIdJourneyResponse(
      planHid: genHid(name.title),
      planUid: genPlanUid,
      title: name.title,
      synopsis: name.synopsis!,
      answer: ServerAnswer(
        session: request.session,
        type: maia.ServerAnswerTypeEnum.ACCEPTED_SERVER_ANSWER_TYPE,
      ),
    );

    maia.logiResponse(call, response);

    return response;
  }

  static final _genNames = Names.fantasyCountries();

  @override
  Future<maia.ImageResponse> conceivingImagePlace(
      grpc.ServiceCall call, maia.PromptRequest request) {
    // TODO: implement conceivingImagePlace
    throw UnimplementedError();
  }

  @override
  Future<ConceivingNameAndIdPlaceResponse> conceivingNameAndIdPlace(
      grpc.ServiceCall call, maia.PromptRequest request) {
    // TODO: implement conceivingNameAndIdPlace
    throw UnimplementedError();
  }
}
