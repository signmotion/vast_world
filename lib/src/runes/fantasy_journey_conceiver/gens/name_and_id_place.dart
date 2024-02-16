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

    final numColors = Random().nextInt(5 + 1) + 1;
    final predominantColors = <String, int>{};
    for (var i = 0; i < numColors; ++i) {
      final color = colorMap.randomEntry;
      predominantColors[color.key] = color.value.colorToRgbInt8;
    }

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
