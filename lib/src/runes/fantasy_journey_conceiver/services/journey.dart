part of '../../../../runes/fantasy_journey_conceiver.dart';

class JourneyService extends JourneyServiceBase with ServiceMix {
  @override
  String get name => 'Journey - Fantasy Country Conceiver';

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
}
