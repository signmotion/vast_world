part of '../../../../runes/fantasy_journey_conceiver.dart';

typedef NameAndIdPlaceR = ({
  String planHid,
  String planUid,
  String title,
  String description,
  Map<String, String> predominantColors,
});

class NameAndIdPlaceAiGen extends AiGen<NameAndIdPlaceR, AiGenOptions> {
  const NameAndIdPlaceAiGen({super.fake})
      : super(
          fakeProvider: const NameAndIdPlaceFakeProvider(),
          realProvider: const NameAndIdPlaceRealProvider(),
        );
}

class NameAndIdPlaceFakeProvider extends FakeProvider<NameAndIdPlaceR> {
  const NameAndIdPlaceFakeProvider();

  @override
  NameAndIdPlaceR get next {
    final title = genNames.next.title;

    final numColors = Random().nextInt(5 + 1) + 1;
    final predominantColors = <String, String>{};
    for (var i = 0; i < numColors; ++i) {
      final color = colorMap.randomEntry;
      predominantColors[color.key] =
          color.value.colorToRgbInt8.intToRgbInt8String;
    }

    return (
      planHid: genHid(title),
      planUid: 'p-$genUuid',
      title: title,
      description: faker.lorem.sentences(6).join(' '),
      predominantColors: predominantColors,
    );
  }
}

class NameAndIdPlaceRealProvider extends RealProvider<NameAndIdPlaceR> {
  const NameAndIdPlaceRealProvider();

  @override
  NameAndIdPlaceR get next => throw UnimplementedError();
}
