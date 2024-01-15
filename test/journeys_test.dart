import 'package:vast_world/vast_world.dart' hide Keeper;
import 'package:test/test.dart';

import 'prepare_test_env.dart';

void main() {
  prepareTestEnv();

  group('JourneysPlan', () {
    const sourcePath = 'test/data/journeys/aerwyna_raw/journey_list/0.aerwyna';

    final plan = JourneysPlan.construct();

    final about =
        FileWorker(sourcePath).readAsJsonMapT<String>(pathToFile: '_.json')!;
    final aerwynaJourney = JourneyPlan.construct(
      name: 'Aerwyna',
      greeting: about['greeting']!,
      description: about['description']!,
    );
    plan.addJourney(aerwynaJourney);

    // places
    for (var i = 0; i < 5; ++i) {
      final picture =
          FileWorker(sourcePath).readAsImage(pathToFile: 'place_list/$i.png');
      final story = 'Some story into the place $i...';
      final place = PlacePlan.construct(picture: picture, story: story);
      aerwynaJourney.addPlace(place);
    }

    plan.addJourney(aerwynaJourney);

    test('Check created from raw', () {
      throw UnimplementedError();
    });
  });
}
