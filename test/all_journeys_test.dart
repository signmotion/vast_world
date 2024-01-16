import 'package:dart_helpers/dart_helpers.dart';
import 'package:vast_world/vast_world.dart' hide Keeper;
import 'package:test/test.dart';

import 'prepare_test_env.dart';

void main() {
  prepareTestEnv();

  group('JourneysPlan', () {
    const sourcePath =
        'test/data/journeys/aerwyna_journey_raw/journey_list/0.aerwyna';

    final allJourneys = AllJourneysPlan.construct()..check();

    // journey by Aerwyna
    final about =
        FileWorker(sourcePath).readAsJsonMapString(pathToFile: '_.json')!;
    final aerwynaJourney = JourneyPlan.construct(
      hid: 'aerwyna',
      name: 'Aerwyna',
      greeting: about['greeting']!,
      description: about['description']!,
    )..check();
    final placeCount = int.parse(about['place_count']!);
    for (var i = 0; i < placeCount; ++i) {
      final picture =
          FileWorker(sourcePath).readAsImage(pathToFile: 'place_list/$i.png');
      final story = 'Some story into the place $i...';
      final place = PlacePlan.construct(picture: picture, story: story);
      aerwynaJourney.add(place);
    }

    allJourneys.add(aerwynaJourney);

    test('Check `allJourneys` created from raw', () {
      final imageries = <String, JsonMap>{
        'aerwyna': {
          'name': 'Aerwyna',
          'greeting': about['greeting'],
          'description': about['description'],
        },
      };

      checkPlan(
        allJourneys,
        hid: '',
        imageries: imageries,
      );
    });
  });
}
