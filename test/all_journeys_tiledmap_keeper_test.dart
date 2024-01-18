import 'package:path/path.dart' as p;
import 'package:vast_world/vast_world.dart';
import 'package:test/test.dart';

import 'helpers/constructed_journeys.dart';
import 'prepare_test_env.dart';

typedef Keeper = PlanTiledmapKeeper<AllJourneysPlan, ImageFilesystemBroker,
    TextFilesystemBroker>;

void main() {
  prepareTestEnv();

  group('AllJourneysPlan, keeper for tmx formats', () {
    final plan = constructedAerwynaJourneyFromRaw;

    test(
        'Write place_4_aerwyna_journey_plan to TiledMap format'
        ' and check file structure', () {
      final outputPath = p.join(
        'test',
        'output',
        'journeys',
        'aerwyna_journey_tmx',
        'place_4_aerwyna_journey',
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

      final fw = FileWorker(outputPath);

      // checking root
      expect(fw.existsDirSync(planForKeep.hid), isTrue, reason: fw.npath);

      expect(
        fw.existsSync(planForKeep.hid, VMap.defaultContentFilename),
        isTrue,
        reason: fw.npath,
      );

      // with picture
      expect(
        fw.existsSync(planForKeep.hid, '${PictureComponent().hid}.png'),
        isTrue,
        reason: fw.npath,
      );

      // checking imageries of the root
      expect(planForKeep.imageries, isEmpty);
    });

    test(
        'Write place_0_aerwyna_journey_plan to TiledMap format'
        ' and check file structure', () {
      final outputPath = p.join(
        'test',
        'output',
        'journeys',
        'aerwyna_journey_tmx',
        'place_0_aerwyna_journey',
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

      final fw = FileWorker(outputPath);

      // checking root
      expect(fw.existsDirSync(planForKeep.hid), isTrue, reason: fw.npath);

      expect(
        fw.existsSync(planForKeep.hid, VMap.defaultContentFilename),
        isTrue,
        reason: fw.npath,
      );

      // with picture
      expect(
        fw.existsSync(planForKeep.hid, '${PictureComponent().hid}.png'),
        isTrue,
        reason: fw.npath,
      );

      // checking imageries of the root
      expect(planForKeep.imageries, isEmpty);
    });

    test(
        'Write aerwyna_journey_plan to TiledMap format'
        ' and check file structure', () {
      final outputPath = p.join(
        'test',
        'output',
        'journeys',
        'aerwyna_journey_tmx',
        'aerwyna_journey',
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

      final fw = FileWorker(outputPath);

      // checking root
      expect(fw.existsDirSync(planForKeep.hid), isTrue, reason: fw.npath);

      expect(
        fw.existsSync(planForKeep.hid, VMap.defaultContentFilename),
        isTrue,
        reason: fw.npath,
      );

      // with picture
      expect(
        fw.existsSync(planForKeep.hid, '${PictureComponent().hid}.png'),
        isFalse,
        reason: fw.npath,
      );

      // checking imageries of the root
      expect(planForKeep.imageries.length, 5);
    });
  });
}
