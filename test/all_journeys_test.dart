import 'package:dart_helpers/dart_helpers.dart';
import 'package:vast_world/vast_world.dart' hide Keeper;
import 'package:test/test.dart';

import 'helpers2d.dart';
import 'prepare_test_env.dart';

void main() {
  prepareTestEnv();

  group('JourneysPlan', () {
    final u = Universe();

    const sourcePath =
        'test/data/journeys/aerwyna_journey_raw/journey_list/0.aerwyna';

    final allJourneys = AllJourneysPlan(u);

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
      final place = PlacePlan(u, picture: picture, story: story);
      aerwynaJourney.addImagery(place);
    }

    allJourneys.addImagery(aerwynaJourney);

    test('Check `allJourneys` created from raw', () {
      checkPlan(
        allJourneys,
        hid: '',
        imageryIds: ['aerwyna'],
      );
    });

    test('Check `aerwynaJourney` created from raw', () {
      checkPlan(
        aerwynaJourney,
        hid: 'aerwyna',
        imageryIds: [],
      );
    });

    test('Check places of `aerwynaJourney` created from raw', () {
      // TODO
    });
  });
}
