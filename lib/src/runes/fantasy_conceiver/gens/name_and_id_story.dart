part of '../../../../runes/fantasy_conceiver.dart';

class NameAndIdStoryAiGen extends AiGen<NameAndIdStoryBase, AiGenOptions> {
  const NameAndIdStoryAiGen({super.fake})
      : super(
          fakeProvider: const NameAndIdStoryFakeProvider(),
          realProvider: const NameAndIdStoryRealProvider(),
        );
}

class NameAndIdStoryFakeProvider extends FakeProvider<NameAndIdStoryBase> {
  const NameAndIdStoryFakeProvider();

  @override
  NameAndIdStoryBase get next {
    final title = faker.lorem.sentence();

    return NameAndIdStoryBase(
      planHid: genHid(title),
      planUid: 'p-$genUuid',
      title: title,
      text: faker.lorem.sentences(21).join(' '),
    );
  }
}

class NameAndIdStoryRealProvider extends RealProvider<NameAndIdStoryBase> {
  const NameAndIdStoryRealProvider();

  @override
  NameAndIdStoryBase get next =>
      throw UnimplementedError(StackTrace.current.toString());
}
