import 'dart:io';

import 'package:astronomical_measurements/astronomical_measurements.dart';
import 'package:id_gen/id_gen.dart';
import 'package:path/path.dart' as p;
import 'package:vast_world/vast_world.dart';
import 'package:test/test.dart';

import 'prepare_test_env.dart';

typedef PlanKeeper = Plan2DIntTiledmapKeeper<String, StringFilesystemBroker>;

void main() {
  prepareTestEnv();

  group('Construct Plan2D for planet and save it to TiledMap format', () {
    const hid = 'raeria';
    // select the radius of the planet according to the size of the
    // existing image of the planet map
    // circumference == image size
    const circumferenceX = 870;
    const circumferenceY = 680;
    // 1 cell ~= 50 km
    const scale = 50;
    final (rx, ry) = size2DToCircleRadius(
      circumferenceX,
      circumferenceY,
      scale: scale,
    );
    // with this image size and world scale we have:
    //  rx = 6923 km, unwrapped to circumferenceX * scale = 43500
    //  ry = 5411 km, unwrapped to circumferenceY * scale = 34000
    var plan = Plan2D<int>.planet(
      'test/data/planet_raw/$hid/bg.png',
      realRadiusX: Unit.kilometre(rx),
      realRadiusY: Unit.kilometre(ry),
      scale: scale,
      innerDataDefaultValue: 12,
      outerDataDefaultValue: 0,
    );

    // fill the plan

    // insert an imagery (projection of other plan) to plan
    // coords takes from tmx-file
    const imageryPosition = (505 * scale, 85 * scale);
    final imageryRealWidth = Unit.kilometre(1100);
    const imageryHid = 'ri';
    plan += PictureImagery(
      'test/data/planet_raw/$hid/$imageryHid/bg.png',
      position: imageryPosition,
      // the height will be calculated in proportion to the image size
      realWidth: imageryRealWidth,
    );
    // calculated by [width] and image size
    final imageryRealHeight = Unit.kilometre(780);

    void checkImagery(PictureImagery imagery) {
      expect(imagery.npath, 'test/data/planet_raw/$hid/$imageryHid/bg.png');
      expect(imagery.hid, imageryHid);
      expect(imagery.uid, isUuid);
      expect(imagery.id, imageryHid);
      expect(imagery.background.image, isNotNull);
      expect(imagery.background.image!.width, 3520);
      expect(imagery.background.image!.height, 2496);
      expect(imagery.position, imageryPosition);
      expect(imagery.realWidth, imageryRealWidth);
      expect(imagery.realHeight, imageryRealHeight);

      final pl = plan.imageryToPlan(imagery);
      expect(pl.realWidth.value, imageryRealWidth);
      expect(pl.realHeight.value, imageryRealHeight);

      expect(pl.axisWidth, 3520);
      expect(pl.axisHeight, 2496);

      expect(pl.square, 3520 * 2496);

      expect(
          pl.background.npath, 'test/data/planet_raw/$hid/$imageryHid/bg.png');
      expect(pl.background.image, isNotNull);
    }

    void checkPlan(Plan2D<int> plan) {
      expect(plan.hid, hid);
      expect(plan.uid, isUuid);
      expect(plan.id, hid);

      // should be `circumference * scale` but we can have uncertainties...
      expect(plan.realWidth.value.round(), circumferenceX * scale);
      expect(plan.realHeight.value.round(), circumferenceY * scale);

      expect(plan.axisWidth, circumferenceX);
      expect(plan.axisHeight, circumferenceY);

      expect(plan.square, circumferenceX * circumferenceY);

      expect(plan.background.npath, 'test/data/planet_raw/$hid/bg.png');
      expect(plan.background.image, isNotNull);

      final imagery = plan.imageries.single as PictureImagery;
      checkImagery(imagery);

      // check imagery size into plan
      final (isx, isy) = plan.axisSizeImagery(imagery);
      expect((isx, isy), (22, 16));
    }

    test('Check created from raw', () {
      checkPlan(plan);
    });

    test('Read from TiledMap format and check created from tmx', () {
      // final sourcePath = p.join('test', 'data');
      // final broker = StringFilesystemBroker(sourcePath);
      // final keeper = PlanKeeper(broker);
      // final loaded = keeper.read('planet_raeria_tmx')!;
      // checkPlan(loaded);
    });

    test('Write to TiledMap format and check file structure', () {
      final outputPath = p.join('test', 'output', 'planet_tmx');
      final broker = StringFilesystemBroker(outputPath);
      final keeper = PlanKeeper(broker);
      keeper.write(plan);

      {
        final pf = p.join(outputPath, plan.id);
        expect(Directory(pf).existsSync(), isTrue, reason: pf);
      }
      {
        final pf = p.join(outputPath, plan.id, '_.tmx');
        expect(File(pf).existsSync(), isTrue, reason: pf);
      }
    });
  });
}
