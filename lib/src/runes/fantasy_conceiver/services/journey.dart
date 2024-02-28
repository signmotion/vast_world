part of '../../../../runes/fantasy_conceiver.dart';

class JourneyService extends JourneyServiceBase with ServiceMix {
  JourneyService(this.server);

  /// This service requires an access to server.
  final NativeServer server;

  @override
  String get name => 'Journey - Fantasy Conceiver';

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

  // generators section

  final gensNames = <String, Names>{};
}
