part of '../../../../runes/fantasy_journey_conceiver.dart';

class JourneyService extends JourneyServiceBase with ServiceMix {
  JourneyService(this.server);

  /// This service requires an access to server.
  final NativeServer server;

  @override
  String get name => 'Journey - Fantasy Journey Conceiver';

  @override
  Future<ConceiveNameAndIdJourneyResponse> conceiveNameAndId(
    grpc.ServiceCall call,
    PromptRequest request,
  ) async {
    maia.logiRequest(call, request);

    // respect an each session
    final gen = gensNames.update(
      request.session,
      (gen) => gen,
      ifAbsent: () => Names.fantasyCountries(),
    );
    final d = gen.next;

    final response = ConceiveNameAndIdJourneyResponse(
      data: NameAndIdJourneyBase(
        planHid: genHid(d.title),
        planUid: genPlanUid,
        title: d.title,
        synopsis: d.synopsis!,
      ),
      answer: ServerAnswer(
        session: request.session,
        type: maia.ServerAnswerTypeEnum.ACCEPTED_SERVER_ANSWER_TYPE,
      ),
    );

    maia.logiResponse(call, response);

    return response;
  }

  @override
  Future<ConceiveNameAndIdPlaceResponse> conceiveFirstPlaceNameAndId(
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

  // generators section

  final gensNames = <String, Names>{};
  final gensNameAndIdPlace = <String, NameAndIdPlaceAiGen>{};
}
