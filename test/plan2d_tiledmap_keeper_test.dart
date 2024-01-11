import 'dart:io';

import 'package:astronomical_measurements/astronomical_measurements.dart';
import 'package:dart_helpers/dart_helpers.dart';
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
    const sourcePath = 'test/data/planet_raw';
    const planHid = 'raeria';
    // select the radius of the planet according to the size of the
    // existing image of the planet map
    // circumference == image size
    const circumferenceX = 870;
    const circumferenceY = 680;
    // 1 cell ~= 50 km
    const scale = 50.0;
    final (rx, ry) = size2DToCircleRadius(
      circumferenceX,
      circumferenceY,
      scale: scale,
    );
    // with this image size and world scale we have:
    //  rx = 6923 km, unwrapped to circumferenceX * scale = 43500
    //  ry = 5411 km, unwrapped to circumferenceY * scale = 34000
    var plan = Plan.planet(
      sourcePath,
      planHid,
      realRadiusX: Unit.kilometre(rx),
      realRadiusY: Unit.kilometre(ry),
      scale: scale,
      innerDataDefaultValue: 12,
      outerDataDefaultValue: 0,
    );

    // fill the plan

    // insert the imageries (projections of other plans) to this plan
    // positions takes from tmx-file
    const imageryAxisPositionRi = (505, 85);
    const axisSizeInPlanRi = (22, 16);
    final imageryRealWidthRi = Unit.kilometre(1100);
    const imageryHidRi = 'ri';
    plan += PictureImagery(
      sourcePath,
      planHid,
      imageryHidRi,
      axisPosition: imageryAxisPositionRi,
      // the height will be calculated in proportion to the image size
      realWidth: imageryRealWidthRi,
    );

    const imageryAxisPositionRiEast = (505 + 22, 85);
    const axisSizeInPlanRiEast = (7, 16);
    final imageryRealWidthRiEast = Unit.kilometre(312);
    const imageryHidRiEast = 'ri_east';
    plan += PictureImagery(
      sourcePath,
      planHid,
      imageryHidRiEast,
      axisPosition: imageryAxisPositionRiEast,
      // the height will be calculated in proportion to the image size
      realWidth: imageryRealWidthRiEast,
    );

    // calculated by [width] and image size
    //final imageryRealHeight = Unit.kilometre(780);

    final testImageries = <String, JsonMap>{
      'raeria.ri': {
        // !) this is a HID for imagery, not for a plan
        // for construct a plan we are using [imagery.hidForPlan]
        'hid': 'raeria.ri',
        'npath': '$sourcePath/raeria/ri',
        'scale': 0.3125,
        'axisWidth': 3520,
        'axisHeight': 2496,
        'axisSquare': 3520 * 2496,
        'axisPosition': imageryAxisPositionRi,
        'axisSizeInPlan': axisSizeInPlanRi,
      },
      'raeria.ri_east': {
        'hid': 'raeria.ri_east',
        'npath': '$sourcePath/raeria/ri_east',
        'scale': 0.78,
        'axisWidth': 400,
        'axisHeight': 1000,
        'axisSquare': 400 * 1000,
        'axisPosition': imageryAxisPositionRiEast,
        'axisSizeInPlan': axisSizeInPlanRiEast,
      },
    };

    test('Check created from raw', () {
      checkPlan(
        plan,
        planHid: planHid,
        npath: '$sourcePath/$planHid',
        scale: scale,
        axisWidth: circumferenceX,
        axisHeight: circumferenceY,
        axisSquare: circumferenceX * circumferenceY,
        imageries: testImageries,
      );
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
        final pf = p.join(outputPath, planHid);
        expect(Directory(pf).existsSync(), isTrue, reason: pf);
      }
      {
        final pf = p.join(outputPath, planHid, VMap.defaultContentFilename);
        expect(File(pf).existsSync(), isTrue, reason: pf);
      }
      {
        final pf = p.join(outputPath, planHid, VMap.defaultBackgroundFilename);
        expect(File(pf).existsSync(), isTrue, reason: pf);
      }

      // children (imageries)
      for (final imagery in plan.imageries) {
        final hid = imagery.hidForPlan;
        {
          final pf = p.join(outputPath, planHid, hid);
          expect(Directory(pf).existsSync(), isTrue, reason: pf);
        }
        {
          final pf =
              p.join(outputPath, plan.id, hid, VMap.defaultContentFilename);
          expect(File(pf).existsSync(), isTrue, reason: pf);
        }
        {
          final pf =
              p.join(outputPath, plan.id, hid, VMap.defaultBackgroundFilename);
          expect(File(pf).existsSync(), isTrue, reason: pf);
        }
      }
    });

    test('Read from TiledMap format and check created from tmx', () {
      const sourcePath = 'test/data/planet_tmx';
      final keeper = Keeper(
        textBroker: TextFilesystemBroker(sourcePath),
        imageBroker: ImageFilesystemBroker(sourcePath),
      );
      final loaded = keeper.read('raeria');

      expect(loaded, isNotNull);
      checkPlan(
        loaded!,
        planHid: planHid,
        npath: '$sourcePath/$planHid',
        scale: scale,
        axisWidth: circumferenceX,
        axisHeight: circumferenceY,
        axisSquare: circumferenceX * circumferenceY,
        imageries: testImageries,
      );
    });
  });
}

void checkPlan(
  Plan plan, {
  required String planHid,
  required String npath,
  required double scale,
  required int axisWidth,
  required int axisHeight,
  required int axisSquare,
  required Map<String, JsonMap> imageries,
}) {
  expect(plan.hid, planHid);
  expect(plan.uid, isUuid);
  expect(plan.id, plan.hid);

  expect(plan.npath, npath);

  expect(plan.scale, scale);

  // should be `size * scale` but we can have uncertainties...
  expect(plan.realWidth.roundValue(), axisWidth * scale);
  expect(plan.realHeight.roundValue(), axisHeight * scale);
  expect(
    plan.realSquare.roundValue(),
    (axisWidth * scale) * (axisHeight * scale),
  );

  expect(plan.axisWidth, axisWidth);
  expect(plan.axisHeight, axisHeight);
  expect(plan.axisSquare, axisSquare);

  // can be ether full path or `hid/path`, for example:
  // 'test/data/planet_raw/$hid/${VMap.defaultBackgroundFilename}'
  // '$hid/${VMap.defaultBackgroundFilename}'
  expect(
    plan.background.npath,
    endsWith('$planHid/${VMap.defaultBackgroundFilename}'),
  );
  expect(plan.background.image, isNotNull);
  expect(plan.background.image!.width, axisWidth);
  expect(plan.background.image!.height, axisHeight);

  for (final imagery in plan.imageries) {
    final imgs = imageries[imagery.id]!;
    checkImagery(
      plan,
      imagery,
      planHid: planHid,
      imageryHid: imgs['hid'] as String,
      npath: imgs['npath'] as String,
      scale: imgs['scale'] as double,
      axisWidth: imgs['axisWidth'] as int,
      axisHeight: imgs['axisHeight'] as int,
      axisSquare: imgs['axisSquare'] as int,
      axisPosition: imgs['axisPosition'] as (int, int),
    );

    // check imagery size into plan
    final (isx, isy) = plan.axisSizeChildInParent(imagery);
    expect((isx, isy), imgs['axisSizeInPlan']!);
  }
}

void checkImagery(
  Plan plan,
  Imagery imagery, {
  required String planHid,
  required String imageryHid,
  required String npath,
  required double scale,
  required int axisWidth,
  required int axisHeight,
  required int axisSquare,
  required (int, int) axisPosition,
}) {
  expect(
    imagery.npath,
    'test/data/planet_raw/${imageryHid.hidToNPath}',
  );
  expect(imagery.hid, imageryHid);
  expect(imagery.uid, isUuid);
  expect(imagery.id, imagery.hid);

  expect(imagery.npath, npath);

  expect(imagery.scale, scale);

  // should be `size * scale` but we can have uncertainties...
  expect(imagery.realWidth.roundValue(), axisWidth * scale);
  expect(imagery.realHeight.roundValue(), axisHeight * scale);
  expect(
    imagery.realSquare.roundValue(),
    (axisWidth * scale) * (axisHeight * scale),
  );

  expect(imagery.axisWidth, axisWidth);
  expect(imagery.axisHeight, axisHeight);
  expect(imagery.axisSquare, axisWidth * axisHeight);

  expect(imagery.axisPosition, axisPosition);

  // can be ether full path or `hid/path`, for example:
  // 'test/data/planet_raw/$hid/${VMap.defaultBackgroundFilename}'
  // '$hid/${VMap.defaultBackgroundFilename}'
  expect(
    imagery.background.npath,
    endsWith('${imageryHid.hidToNPath}/${VMap.defaultBackgroundFilename}'),
  );
  expect(imagery.background.image, isNotNull);
  expect(imagery.background.image!.width, axisWidth);
  expect(imagery.background.image!.height, axisHeight);

  final pl = Plan.imageryToPlan(plan, imagery);
  checkPlan(
    pl,
    planHid: imagery.hidForPlan,
    npath: imagery.npath,
    scale: imagery.scale,
    axisWidth: imagery.axisWidth,
    axisHeight: imagery.axisHeight,
    axisSquare: imagery.axisWidth * imagery.axisHeight,
    imageries: const <String, JsonMap>{},
  );
}
