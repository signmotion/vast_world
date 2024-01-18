import 'package:collection/collection.dart';
import 'package:id_gen/id_gen.dart';
import 'package:vast_world/vast_world.dart';
import 'package:test/test.dart';

// typedef DEPRECATED_PlanContent = Cell2DContent<int>;
// typedef DEPRECATED_Plan = DEPRECATED_Plan2D<DEPRECATED_PlanContent>;
// typedef DEPRECATED_Keeper = Plan2DTiledmapKeeper<DEPRECATED_PlanContent,
//     ImageFilesystemBroker, TextFilesystemBroker>;

void checkPlan(
  Plan<dynamic> plan, {
  required String hid,
  required List<String> imageryIds,
}) {
  expect(hid.isCorrectHid, true, reason: hid);
  expect(plan.hid, hid);

  expect(plan.uid, isUuid);
  expect(plan.uid == plan.hid, isFalse, reason: '${plan.id} == ${plan.hid}');

  expect(plan.imageries.length, imageryIds.length);
  for (final imageryId in imageryIds) {
    final found =
        plan.imageries.firstWhereOrNull((p) => (p as HasIdMix).id == imageryId);
    expect(found, isNotNull);
  }
}


// void checkPlan(
//   DEPRECATED_Plan plan, {
//   required String planHid,
//   String? npath,
//   double? scale,
//   required (int, int) axisSize,
//   int? axisSquare,
//   required Map<String, JsonMap> imageries,
//   Type? shapeType,
// }) {
//   final axisWidth = axisSize.$1;
//   final axisHeight = axisSize.$2;

//   expect(planHid.isCorrectPlanHid, true, reason: planHid);
//   expect(plan.hid, planHid);

//   expect(plan.uid, isUuid);
//   expect(plan.id, plan.hid);

//   if (npath != null) {
//     expect(plan.npath, npath);
//   }

//   if (scale != null) {
//     expect(plan.scale, scale);
//     // should be `size * scale` but we can have uncertainties...
//     expect(plan.realWidth.value, axisWidth * scale);
//     expect(plan.realHeight.value, axisHeight * scale);
//     expect(
//       plan.realSquare.value,
//       (axisWidth * scale) * (axisHeight * scale),
//     );
//   }

//   expect(plan.axisWidth, axisWidth);
//   expect(plan.axisHeight, axisHeight);
//   if (axisSquare != null) {
//     expect(plan.axisSquare, axisSquare);
//   }

//   // can be ether full path or `hid/path`, for example:
//   // 'test/data/worlds/simple_planet_raw/$hid/${VMap.defaultBackgroundFilename}'
//   // '$hid/${VMap.defaultBackgroundFilename}'
//   expect(
//     plan.background.npath,
//     endsWith('$planHid/${VMap.defaultBackgroundFilename}'),
//   );
//   expect(plan.background.image, isNotNull);
//   expect(plan.background.image!.width, axisWidth);
//   expect(plan.background.image!.height, axisHeight);

//   if (shapeType != null) {
//     expect(plan.shape.runtimeType, shapeType, reason: plan.hid);
//   }

//   for (final ie in imageries.entries) {
//     final hid = ie.key;
//     final img = ie.value;
//     final imagery = plan.imageries.firstWhere((e) => e.hid == hid);
//     checkImagery(
//       plan,
//       imagery,
//       planHid: planHid,
//       imageryHid: hid,
//       npath: img['npath'] as String?,
//       scale: img['scale'] as double?,
//       axisPosition: img['axisPosition'] as (int, int),
//       axisSize: img['axisSize'] as (int, int),
//       axisSizeInPlan: img['axisSizeInPlan'] as (int, int),
//       axisSquare: img['axisSquare'] as int?,
//       shapeType: img['shapeType'] as Type?,
//     );
//   }
// }

// void checkImagery(
//   DEPRECATED_Plan plan,
//   DEPRECATED_Imagery imagery, {
//   required String planHid,
//   required String imageryHid,
//   String? npath,
//   double? scale,
//   required (int, int) axisSize,
//   required (int, int) axisSizeInPlan,
//   int? axisSquare,
//   required (int, int) axisPosition,
//   Type? shapeType,
// }) {
//   final axisWidth = axisSize.$1;
//   final axisHeight = axisSize.$2;

//   expect(imageryHid.isCorrectImageryHid, true, reason: imageryHid);
//   expect(imagery.hid, imageryHid);

//   expect(imagery.uid, isUuid);
//   expect(imagery.id, imagery.hid);

//   if (npath != null) {
//     expect(imagery.npath, npath);
//   }

//   if (scale != null) {
//     expect(imagery.scale, scale);
//     // should be `size * scale` but we can have uncertainties...
//     expect(imagery.realWidth.value, axisWidth * scale);
//     expect(imagery.realHeight.value, axisHeight * scale);
//     expect(
//       imagery.realSquare.value,
//       (axisWidth * scale) * (axisHeight * scale),
//     );
//   }

//   expect(imagery.axisWidth, axisWidth);
//   expect(imagery.axisHeight, axisHeight);

//   // check imagery size into plan
//   final (isx, isy) = plan.axisSizeChildInParent(imagery);
//   expect((isx, isy), axisSizeInPlan, reason: '$imagery');

//   if (axisSquare != null) {
//     expect(imagery.axisSquare, axisWidth * axisHeight);
//   }

//   expect(imagery.axisPosition, axisPosition);

//   // can be ether full path or `hid/path`, for example:
//   // 'test/data/simple_planet_raw/$hid/${VMap.defaultBackgroundFilename}'
//   // '$hid/${VMap.defaultBackgroundFilename}'
//   expect(
//     imagery.background.npath,
//     endsWith('${imageryHid.hidToNPath}/${VMap.defaultBackgroundFilename}'),
//   );
//   expect(imagery.background.image, isNotNull, reason: imagery.background.npath);
//   expect(imagery.background.image!.width, axisWidth);
//   expect(imagery.background.image!.height, axisHeight);

//   expect(imagery.shape.runtimeType, shapeType, reason: imagery.hid);

//   final pl = DEPRECATED_Plan.imageryToPlan(plan, imagery);
//   checkPlan(
//     pl,
//     planHid: imagery.hidForPlan,
//     npath: imagery.npath,
//     scale: imagery.scale,
//     axisSize: (imagery.axisWidth, imagery.axisHeight),
//     axisSquare: imagery.axisWidth * imagery.axisHeight,
//     imageries: const <String, JsonMap>{},
//     shapeType: imagery.shape.runtimeType,
//   );
// }
