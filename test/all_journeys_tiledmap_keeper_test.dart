import 'package:path/path.dart' as p;
import 'package:vast_world/vast_world.dart';
import 'package:test/test.dart';

import 'helpers/constructed_journeys.dart';
import 'helpers/helpers2d.dart';
import 'prepare_test_env.dart';

typedef Keeper = PlanTiledmapKeeper<AllJourneysPlan, ImageFilesystemBroker,
    TextFilesystemBroker>;

void main() {
  prepareTestEnv();

  group('AllJourneysPlan, keeper for tmx formats', () {
    final plan = constructedAerwynaJourneyFromRaw;

    test(
        'Write place_4_aerwyna_journey plan to TiledMap format'
        ' and check file structure', () {
      final outputPath = p.join(
        'test',
        'output',
        'journeys',
        'aerwyna_journey_tmx',
        'place_4_aerwyna_journeys',
      );
      final keeper = Keeper(
        textBroker: TextFilesystemBroker(outputPath),
        imageBroker: ImageFilesystemBroker(outputPath),
        readOnly: false,
      );
      keeper.clear();

      // saving the root and imageries plans
      final planForKeep = plan.imageries.single.imageries[4];
      keeper.write(planForKeep, 1);

      checkFileStructurePlan(
        planForKeep,
        outputPath: outputPath,
        existsPicture: true,
        countImageries: 0,
      );
    });

    test(
        'Write place_0_aerwyna_journey plan to TiledMap format'
        ' and check file structure', () {
      final outputPath = p.join(
        'test',
        'output',
        'journeys',
        'aerwyna_journey_tmx',
        'place_0_aerwyna_journeys',
      );
      final keeper = Keeper(
        textBroker: TextFilesystemBroker(outputPath),
        imageBroker: ImageFilesystemBroker(outputPath),
        readOnly: false,
      );
      keeper.clear();

      // saving the root and imageries plans
      final planForKeep = plan.imageries.single.imageries[0];
      keeper.write(planForKeep);

      checkFileStructurePlan(
        planForKeep,
        outputPath: outputPath,
        existsPicture: true,
        countImageries: 0,
      );
    });

    test(
        'Write aerwyna_journey plan to TiledMap format'
        ' and check file structure', () {
      final outputPath = p.join(
        'test',
        'output',
        'journeys',
        'aerwyna_journey_tmx',
        'aerwyna_journeys',
      );
      final keeper = Keeper(
        textBroker: TextFilesystemBroker(outputPath),
        imageBroker: ImageFilesystemBroker(outputPath),
        readOnly: false,
      );
      keeper.clear();

      // saving the root and imageries plans
      final planForKeep = plan.imageries.single;
      keeper.write(planForKeep);

      checkFileStructurePlan(
        planForKeep,
        outputPath: outputPath,
        existsPicture: false,
        countImageries: 5,
      );
    });

    test(
        'Write all_journeys plan to TiledMap format'
        ' and check file structure', () {
      final outputPath = p.join(
        'test',
        'output',
        'journeys',
        'aerwyna_journey_tmx',
        'journeys',
      );
      final keeper = Keeper(
        textBroker: TextFilesystemBroker(outputPath),
        imageBroker: ImageFilesystemBroker(outputPath),
        readOnly: false,
      );
      keeper.clear();

      // saving the root and imageries plans
      final planForKeep = plan;
      keeper.write(planForKeep);

      checkFileStructurePlan(
        planForKeep,
        outputPath: outputPath,
        existsPicture: false,
        countImageries: 1,
      );
    });
  });
}
