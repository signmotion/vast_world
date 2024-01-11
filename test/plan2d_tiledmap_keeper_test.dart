import 'dart:io';

import 'package:astronomical_measurements/astronomical_measurements.dart';
import 'package:id_gen/id_gen.dart';
import 'package:path/path.dart' as p;
import 'package:vast_world/vast_world.dart';
import 'package:test/test.dart';

import 'prepare_test_env.dart';

typedef Plan = Plan2D<int>;

typedef Keeper
    = Plan2DTiledmapKeeper<int, ImageFilesystemBroker, TextFilesystemBroker>;

void main() {
  prepareTestEnv();

  group('Construct Plan2D for planet and save it to TiledMap format', () {
    const planHid = 'raeria';
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
    var plan = Plan.planet(
      'test/data/planet_raw',
      planHid,
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
      'test/data/planet_raw',
      planHid,
      imageryHid,
      axisPosition: imageryPosition,
      // the height will be calculated in proportion to the image size
      realWidth: imageryRealWidth,
    );

    // calculated by [width] and image size
    final imageryRealHeight = Unit.kilometre(780);

    void checkImagery(Imagery imagery) {
      expect(
        imagery.npath,
        'test/data/planet_raw/$planHid/$imageryHid',
      );
      expect(imagery.hid, '$planHid.$imageryHid');
      expect(imagery.uid, isUuid);
      expect(imagery.id, imagery.hid);

      expect(imagery.background.image, isNotNull);
      expect(imagery.background.image!.width, 3520);
      expect(imagery.background.image!.height, 2496);

      expect(imagery.axisWidth, 3520);
      expect(imagery.axisHeight, 2496);
      expect(imagery.axisSquare, 3520 * 2496);
      expect(imagery.axisPosition, imageryPosition);
      expect(imagery.realWidth, imageryRealWidth);
      expect(imagery.realHeight, imageryRealHeight);

      final pl = plan.imageryToPlan(imagery);

      expect(
        pl.background.npath,
        endsWith('$planHid/$imageryHid/${VMap.defaultBackgroundFilename}'),
      );
      expect(pl.background.image, isNotNull);
      expect(pl.background.image!.width, 3520);
      expect(pl.background.image!.height, 2496);

      expect(pl.axisWidth, 3520);
      expect(pl.axisHeight, 2496);
      expect(pl.axisSquare, 3520 * 2496);
      expect(pl.realWidth.value, imageryRealWidth);
      expect(pl.realHeight.value, imageryRealHeight);
    }

    void checkPlan(Plan plan) {
      expect(plan.hid, planHid);
      expect(plan.uid, isUuid);
      expect(plan.id, plan.hid);

      expect(plan.scale, scale);

      // should be `circumference * scale` but we can have uncertainties...
      expect(plan.realWidth.value.round(), circumferenceX * scale);
      expect(plan.realHeight.value.round(), circumferenceY * scale);

      expect(plan.axisWidth, circumferenceX);
      expect(plan.axisHeight, circumferenceY);

      expect(plan.axisSquare, circumferenceX * circumferenceY);

      // can be ether full path or `hid/path`, for example:
      // 'test/data/planet_raw/$hid/${VMap.defaultBackgroundFilename}'
      // '$hid/${VMap.defaultBackgroundFilename}'
      expect(
        plan.background.npath,
        endsWith('$planHid/${VMap.defaultBackgroundFilename}'),
      );

      expect(plan.background.image, isNotNull);

      for (final imagery in plan.imageries) {
        checkImagery(imagery);

        // check imagery size into plan
        final (isx, isy) = plan.axisSizeChildInParent(imagery);
        expect((isx, isy), (22, 16));
      }
    }

    test('Check created from raw', () {
      checkPlan(plan);
    });

    test('Read from TiledMap format and check created from tmx', () {
      final sourcePath = p.join('test', 'data', 'planet_tmx');
      final keeper = Keeper(
        textBroker: TextFilesystemBroker(sourcePath),
        imageBroker: ImageFilesystemBroker(sourcePath),
      );
      final loaded = keeper.read('raeria');

      expect(loaded, isNotNull);
      checkPlan(loaded!);
    });

    test('Write to TiledMap format and check file structure', () {
      final outputPath = p.join('test', 'output', 'planet_tmx');
      final keeper = Keeper(
        textBroker: TextFilesystemBroker(outputPath),
        imageBroker: ImageFilesystemBroker(outputPath),
      );
      keeper.clear();

      keeper.write(plan);

      // root (plan)
      {
        final pf = p.join(outputPath, plan.id);
        expect(Directory(pf).existsSync(), isTrue, reason: pf);
      }
      {
        final pf = p.join(outputPath, plan.id, VMap.defaultContentFilename);
        expect(File(pf).existsSync(), isTrue, reason: pf);
      }
      {
        final pf = p.join(outputPath, plan.id, VMap.defaultBackgroundFilename);
        expect(File(pf).existsSync(), isTrue, reason: pf);
      }

      // child (imagery)
      final ri = plan.imageries.single.id;
      {
        final pf = p.join(outputPath, plan.id, ri);
        expect(Directory(pf).existsSync(), isTrue, reason: pf);
      }
      {
        final pf = p.join(outputPath, plan.id, ri, VMap.defaultContentFilename);
        expect(File(pf).existsSync(), isTrue, reason: pf);
      }
      {
        final pf =
            p.join(outputPath, plan.id, ri, VMap.defaultBackgroundFilename);
        expect(File(pf).existsSync(), isTrue, reason: pf);
      }
    });
  });
}
