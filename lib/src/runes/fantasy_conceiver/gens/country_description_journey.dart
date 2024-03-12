part of '../../../../runes/fantasy_conceiver.dart';

class CountryDescriptionJourneyAiGen
    extends AiGen<CountryDescriptionJourneyBase, AiGenOptions> {
  const CountryDescriptionJourneyAiGen({super.fake})
      : super(
          fakeProvider: const CountryDescriptionJourneyFakeProvider(),
          realProvider: const CountryDescriptionJourneyRealProvider(),
        );
}

class CountryDescriptionJourneyFakeProvider
    extends FakeProvider<CountryDescriptionJourneyBase> {
  const CountryDescriptionJourneyFakeProvider();

  @override
  CountryDescriptionJourneyBase get next => CountryDescriptionJourneyBase(
        description: faker.lorem.sentences(6).join(' '),
      );
}

class CountryDescriptionJourneyRealProvider
    extends RealProvider<CountryDescriptionJourneyBase> {
  const CountryDescriptionJourneyRealProvider();

  @override
  CountryDescriptionJourneyBase get next =>
      throw UnimplementedError(StackTrace.current.toString());
}
