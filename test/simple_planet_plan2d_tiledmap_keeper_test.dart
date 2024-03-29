@Skip('TODO')

import 'package:test/test.dart';

void main() {}

// import 'dart:io';

// import 'package:astronomical_measurements/astronomical_measurements.dart';
// import 'package:dart_helpers/dart_helpers.dart';
// import 'package:path/path.dart' as p;
// import 'package:vast_world/vast_world.dart' hide Keeper;
// import 'package:test/test.dart';

// import 'helpers2d.dart';
// import 'prepare_test_env.dart';

// void main() {
//   prepareTestEnv();

//   group('Work with the simple Plan2D for planet, raw and tmx formats', () {
//     const sourcePath = 'test/data/worlds/simple_planet_raw';
//     const planHid = 'raeria';
//     // select the radius of the planet according to the size of the
//     // existing image of the planet map
//     // circumference == image size
//     const circumferenceX = 870;
//     const circumferenceY = 680;
//     // 1 cell ~= 50 km
//     const scale = 50.0;
//     final radius =
//         size2DToCircleRadius(circumferenceX, circumferenceY, scale: scale);
//     // with this image size and world scale we have:
//     //  rx = 6923 km, unwrapped to circumferenceX * scale = 43500 km
//     //  ry = 5411 km, unwrapped to circumferenceY * scale = 34000 km
//     var plan = DEPRECATED_Plan.planet(
//       sourcePath,
//       planHid,
//       realRadiusX: Unit.kilometre(radius.x),
//       realRadiusY: Unit.kilometre(radius.y),
//       scale: scale,
//       innerDataDefaultValue: 12,
//       outerDataDefaultValue: 0,
//     );

//     // fill the plan

//     // insert the imageries (projections of other plans) to this plan
//     // positions takes from tmx-file
//     const imageryHidRi = 'ri';
//     const imageryAxisPositionRi = (505, 85);
//     const imageryAxisSizeRi = (3520, 2496);
//     final imageryRealWidthRi = Unit.kilometre(1100);
//     final imageryAxisSizeRiInPlan =
//         plan.axisSizeInParent(imageryRealWidthRi, imageryAxisSizeRi);
//     plan += DEPRECATED_PictureImagery.fromImage(
//       sourcePath,
//       planHid,
//       imageryHidRi,
//       axisPosition: imageryAxisPositionRi,
//       // the height will be calculated in proportion to the image size
//       realWidth: imageryRealWidthRi,
//       anchor: plan.anchor,
//       axisType: plan.axisType,
//       shape: const InfinityShape(),
//     );

//     const imageryHidRiEast = 'ri_east';
//     final imageryAxisPositionRiEast = (505 + imageryAxisSizeRiInPlan.$1, 85);
//     const imageryAxisSizeRiEast = (400, 1000);
//     final imageryRealWidthRiEast = Unit.kilometre(312);
//     final imageryAxisSizeRiEastInPlan =
//         plan.axisSizeInParent(imageryRealWidthRiEast, imageryAxisSizeRiEast);
//     plan += DEPRECATED_PictureImagery.fromImage(
//       sourcePath,
//       planHid,
//       imageryHidRiEast,
//       axisPosition: imageryAxisPositionRiEast,
//       // the height will be calculated in proportion to the image size
//       realWidth: imageryRealWidthRiEast,
//       anchor: plan.anchor,
//       axisType: plan.axisType,
//       shape: const InfinityShape(),
//     );

//     // wiil be calculated by [width] and image size
//     // final imageryRealHeightX = ...

//     final testImageries = <String, JsonMap>{
//       // ! the key is a HID for imagery
//       // for construct a plan we will use [imagery.hidForPlan]
//       'raeria.ri': {
//         'npath': '$sourcePath/$planHid/ri',
//         'scale': 0.3125,
//         'axisPosition': imageryAxisPositionRi,
//         'axisSize': (3520, 2496),
//         'axisSizeInPlan': imageryAxisSizeRiInPlan,
//         'axisSquare': 3520 * 2496,
//         'shapeType': InfinityShape,
//       },
//       'raeria.ri_east': {
//         'npath': '$sourcePath/$planHid/ri_east',
//         'scale': 0.78,
//         'axisPosition': imageryAxisPositionRiEast,
//         'axisSize': (400, 1000),
//         'axisSizeInPlan': imageryAxisSizeRiEastInPlan,
//         'axisSquare': 400 * 1000,
//         'shapeType': InfinityShape,
//       },
//     };

//     test('Check created from raw', () {
//       checkPlan(
//         plan,
//         planHid: planHid,
//         npath: '$sourcePath/$planHid',
//         scale: scale,
//         axisSize: (circumferenceX, circumferenceY),
//         axisSquare: circumferenceX * circumferenceY,
//         imageries: testImageries,
//         shapeType: InfinityShape,
//       );
//     });

//     test('Write to TiledMap format and check file structure', () {
//       final outputPath =
//           p.join('test', 'output', 'worlds', 'simple_planet_tmx');
//       final keeper = DEPRECATED_Keeper(
//         textBroker: TextFilesystemBroker(outputPath),
//         imageBroker: ImageFilesystemBroker(outputPath),
//         readOnly: false,
//       );
//       keeper.clear();

//       keeper.write(plan);

//       // root (plan)
//       {
//         final pf = p.join(outputPath, planHid);
//         expect(Directory(pf).existsSync(), isTrue, reason: pf);
//       }
//       {
//         final pf = p.join(outputPath, planHid, VMap.defaultContentFilename);
//         expect(File(pf).existsSync(), isTrue, reason: pf);
//       }
//       {
//         final pf = p.join(outputPath, planHid, VMap.defaultBackgroundFilename);
//         expect(File(pf).existsSync(), isTrue, reason: pf);
//       }

//       // children (imageries)
//       for (final imagery in plan.imageries) {
//         final hid = imagery.hidForPlan;
//         {
//           final pf = p.join(outputPath, planHid, hid);
//           expect(Directory(pf).existsSync(), isTrue, reason: pf);
//         }
//         {
//           final pf =
//               p.join(outputPath, plan.id, hid, VMap.defaultContentFilename);
//           expect(File(pf).existsSync(), isTrue, reason: pf);
//         }
//         {
//           final pf =
//               p.join(outputPath, plan.id, hid, VMap.defaultBackgroundFilename);
//           expect(File(pf).existsSync(), isTrue, reason: pf);
//         }
//       }
//     });

//     test('Read from TiledMap format and check it', () {
//       const sourcePath = 'test/data/worlds/simple_planet_tmx';
//       final keeper = DEPRECATED_Keeper(
//         textBroker: TextFilesystemBroker(sourcePath),
//         imageBroker: ImageFilesystemBroker(sourcePath),
//       );
//       final loaded = keeper.read('raeria');
//       expect(loaded, isNotNull);

//       testImageries['raeria.ri']!['npath'] = '$sourcePath/$planHid/ri';
//       testImageries['raeria.ri_east']!['npath'] =
//           '$sourcePath/$planHid/ri_east';

//       checkPlan(
//         loaded!,
//         planHid: planHid,
//         npath: '$sourcePath/$planHid',
//         scale: scale,
//         axisSize: (circumferenceX, circumferenceY),
//         axisSquare: circumferenceX * circumferenceY,
//         imageries: testImageries,
//         shapeType: InfinityShape,
//       );
//     });
//   });
// }
