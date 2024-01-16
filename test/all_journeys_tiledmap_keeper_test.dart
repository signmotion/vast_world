import 'dart:io';

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
        'Write place_4_aerwyna_journey_plan to TiledMap format and check file structure',
        () {
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

      // checking root
      {
        final pf = p.join(outputPath, planForKeep.hid);
        expect(Directory(pf).existsSync(), isTrue, reason: pf);
      }
      {
        final pf =
            p.join(outputPath, planForKeep.hid, VMap.defaultContentFilename);
        expect(File(pf).existsSync(), isTrue, reason: pf);
      }
      {
        // with background
        final pf = p.join(
            outputPath, planForKeep.hid, '${PictureComponent().hid}.png');
        expect(File(pf).existsSync(), isTrue, reason: pf);
      }

      // checking imageries of the root
      expect(planForKeep.imageries, isEmpty);
    });
  });
}
