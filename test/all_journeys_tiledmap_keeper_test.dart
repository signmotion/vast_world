import 'package:path/path.dart' as pf;
import 'package:test/test.dart';

import 'helpers/construct.dart';
import 'helpers/construct_journeys.dart';
import 'helpers/helpers2d.dart';
import 'prepare_test_env.dart';

void main() {
  prepareTestEnv();

  group('AllJourneysPlan, keeper for tmx formats', () {
    final plan = constructedAerwynaJourneyFromRaw;

    test(
        'Write place_4_aerwyna_journey plan to TiledMap format'
        ' and check file structure', () {
      final outputPath = pf.join(
        'test',
        'output',
        'journeys',
        'aerwyna_journey_tmx',
        'place_4_aerwyna_journeys',
      );
      final keeper = constructKeeper(outputPath)..clear();

      // saving the root and exposed plans
      final planForKeep = plan.impactsOnPlans.single.impactsOnPlans[4];
      keeper.write(planForKeep, 1);

      checkFileStructurePlan(
        planForKeep,
        outputPath: outputPath,
        existsPicture: true,
        countExposed: 0,
        checkPathPresence: [],
        checkPathAbsence: ['rendered'],
      );
    }, tags: ['current']);

    test(
        'Write place_0_aerwyna_journey plan to TiledMap format'
        ' and check file structure', () {
      final outputPath = pf.join(
        'test',
        'output',
        'journeys',
        'aerwyna_journey_tmx',
        'place_0_aerwyna_journeys',
      );
      final keeper = constructKeeper(outputPath)..clear();

      // saving the root and exposed plans
      final planForKeep = plan.impactsOnPlans.single.impactsOnPlans[0];
      keeper.write(planForKeep);

      checkFileStructurePlan(
        planForKeep,
        outputPath: outputPath,
        existsPicture: true,
        countExposed: 0,
        checkPathPresence: [],
        checkPathAbsence: ['rendered'],
      );
    });

    test(
        'Write aerwyna_journey plan to TiledMap format'
        ' and check file structure', () {
      final outputPath = pf.join(
        'test',
        'output',
        'journeys',
        'aerwyna_journey_tmx',
        'aerwyna_journeys',
      );
      final keeper = constructKeeper(outputPath)..clear();

      // saving the root and exposed plans
      final planForKeep = plan.impactsOnPlans.single;
      keeper.write(planForKeep);

      checkFileStructurePlan(
        planForKeep,
        outputPath: outputPath,
        existsPicture: false,
        countExposed: 5,
        checkPathPresence: [
          'rendered/image/place_0/data.png',
          'rendered/image/place_1/data.png',
          'rendered/image/place_2/data.png',
          'rendered/image/place_3/data.png',
          'rendered/image/place_4/data.png',
        ],
        checkPathAbsence: [],
      );
    });

    test(
        'Write all_journeys plan to TiledMap format'
        ' and check file structure', () {
      final outputPath = pf.join(
        'test',
        'output',
        'journeys',
        'aerwyna_journey_tmx',
        'journeys',
      );
      final keeper = constructKeeper(outputPath)..clear();

      // saving the root and exposed plans
      final planForKeep = plan;
      keeper.write(planForKeep);

      checkFileStructurePlan(
        planForKeep,
        outputPath: outputPath,
        existsPicture: false,
        countExposed: 1,
        checkPathPresence: ['rendered/image/aerwyna/data.png'],
        checkPathAbsence: [],
      );
    });
  });
}
