part of '../../../../runes/fantasy_journey_conceiver.dart';

class NameAndIdPlaceAiGen extends AiGen<NameAndIdPlaceBase, AiGenOptions> {
  const NameAndIdPlaceAiGen({super.fake})
      : super(
          fakeProvider: const NameAndIdPlaceFakeProvider(),
          realProvider: const NameAndIdPlaceRealProvider(),
        );
}

class NameAndIdPlaceFakeProvider extends FakeProvider<NameAndIdPlaceBase> {
  const NameAndIdPlaceFakeProvider();

  @override
  NameAndIdPlaceBase get next {
    final title = genNames.next.title;

    final numColors = faker.randomGenerator.integer(5, min: 2);
    final pc = colorMap.randomEntries(numColors);
    final predominantColors = {
      for (final e in pc) e.key: e.value.colorRgbToIntRgb
    };

    return NameAndIdPlaceBase(
      planHid: genHid(title),
      planUid: 'p-$genUuid',
      title: title,
      description: faker.lorem.sentences(6).join(' '),
      predominantColors: predominantColors,
    );
  }
}

class NameAndIdPlaceRealProvider extends RealProvider<NameAndIdPlaceBase> {
  const NameAndIdPlaceRealProvider();

  @override
  NameAndIdPlaceBase get next =>
      throw UnimplementedError(StackTrace.current.toString());
}
