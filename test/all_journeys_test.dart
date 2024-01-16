import 'package:vast_world/vast_world.dart';
import 'package:test/test.dart';

import 'helpers2d.dart';
import 'prepare_test_env.dart';

void main() {
  prepareTestEnv();

  group('JourneysPlan', () {
    final u = Universe();

    const sourcePath =
        'test/data/journeys/aerwyna_journey_raw/journey_list/0.aerwyna';

    final allJourneys = AllJourneysPlan(u, hid: 'all');

    // journey by Aerwyna
    final about =
        FileWorker(sourcePath).readAsJsonMapString(pathToFile: '_.json')!;
    final aerwynaJourney = JourneyPlan(
      u,
      hid: 'aerwyna',
      name: 'Aerwyna',
      greeting: about['greeting']!,
      description: about['description']!,
    );
    final placeCount = int.parse(about['place_count']!);
    for (var i = 0; i < placeCount; ++i) {
      final picture =
          FileWorker(sourcePath).readAsImage(pathToFile: 'place_list/$i.png');
      final story = 'Some story into the place $i...';
      final place =
          PlacePlan(u, hid: 'place_$i', picture: picture, story: story);
      aerwynaJourney.addImagery(place);
    }

    allJourneys.addImagery(aerwynaJourney);

    test('Check `allJourneys` created from raw', () {
      checkPlan(
        allJourneys,
        hid: 'all',
        imageryIds: ['aerwyna'],
      );
    });

    test('Check `aerwynaJourney` created from raw', () {
      checkPlan(
        aerwynaJourney,
        hid: 'aerwyna',
        imageryIds: ['place_0', 'place_1', 'place_2', 'place_3', 'place_4'],
      );
    });

    test('Check places of `aerwynaJourney` created from raw', () {
      for (final imagery in aerwynaJourney.imageries) {
        checkPlan(
          imagery,
          hid: imagery.hid,
          imageryIds: [],
        );
      }
    });

    test('Check Universe created from raw', () {
      //print(u);
      final su = u.toJson();
      expect(su['entity_count'], 7);
      expect((su['entity_list'] as Iterable<dynamic>).length, 7);
      expect(su['system_count'], 0);
      expect((su['system_list'] as Iterable<dynamic>).length, 0);
    });
  });
}
