part of '../../../../runes/fantasy_journey_conceiver.dart';

class JourneyService extends JourneyServiceBase with ServiceMix {
  @override
  String get name => 'Journey - Fantasy Country Conceiver';

  @override
  Future<ConceiveNameAndIdJourneyResponse> conceiveNameAndId(
    grpc.ServiceCall call,
    PromptRequest request,
  ) async {
    maia.logiRequest(call, request);

    final name = _genNames.next;
    final response = ConceiveNameAndIdJourneyResponse(
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
  Future<ConceiveNameAndIdPlaceResponse> conceiveFirstPlaceNameAndId(
    grpc.ServiceCall call,
    maia.PromptRequest request,
  ) async {
    maia.logiRequest(call, request);

    final d = _nameAndIdPlaceGen.next!;
    final response = ConceiveNameAndIdPlaceResponse(
      planHid: d.planHid,
      planUid: d.planUid,
      title: d.title,
      description: d.description,
      predominantColors: d.predominantColors,
      answer: ServerAnswer(
        session: request.session,
        type: maia.ServerAnswerTypeEnum.ACCEPTED_SERVER_ANSWER_TYPE,
      ),
    );

    maia.logiResponse(call, response);

    return response;
  }

  static const _nameAndIdPlaceGen = NameAndIdPlaceAiGen();
}
