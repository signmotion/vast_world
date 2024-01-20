import 'package:collection/collection.dart';
import 'package:id_gen/id_gen.dart';
import 'package:vast_world/vast_world.dart';
import 'package:test/test.dart';
import 'package:wfile/wfile.dart';
import 'package:xml/xml.dart';

// typedef DEPRECATED_PlanContent = Cell2DContent<int>;
// typedef DEPRECATED_Plan = DEPRECATED_Plan2D<DEPRECATED_PlanContent>;
// typedef DEPRECATED_Keeper = Plan2DTiledmapKeeper<DEPRECATED_PlanContent,
//     ImageFilesystemBroker, TextFilesystemBroker>;

void checkFileStructurePlan(
  Plan<dynamic> plan, {
  required String outputPath,
  required bool existsPicture,
  required int countExposed,
  required List<String> checkPathPresence,
  required List<String> checkPathAbsence,
  required int width,
  required int height,
  required bool infinite,
  required String? imageLayerName,
  required String? imageLayerImageSource,
}) {
  final f = WFile([outputPath, plan.hid], exceptionWhenFileNotExists: true);

  // checking root
  expect(f.existsDir(), isTrue, reason: f.npath);

  // checking content
  expect(
    f.existsFile(VMap.defaultContentFilename),
    isTrue,
    reason: f.npath,
  );

  // with picture
  expect(
    f.existsFile('${PictureComponent().hid}.png'),
    existsPicture,
    reason: f.npath,
  );

  // checking exposed of the root
  expect(plan.impactsOnPlans.length, countExposed);

  // checking other paths for their presence
  for (final path in checkPathPresence) {
    expect(f.existsFile(path), isTrue, reason: f.npath);
  }

  // checking other paths for their absence
  for (final path in checkPathAbsence) {
    expect(f.existsFile(path), isFalse, reason: f.npath);
  }

  // checking data into xml file
  final xml = f.readAsXml('_.tmx')!;
  final map = xml.rootElement;
  expect(map.getAttribute('width'), '$width');
  expect(map.getAttribute('height'), '$height');
  expect(map.getAttribute('infinite') ?? '0', infinite ? '1' : '0');

  final imageLayer = map.findElements('imagelayer').firstOrNull;
  expect(imageLayer?.getAttribute('name'), imageLayerName);

  final imageLayerImage = imageLayer?.findElements('image').firstOrNull;
  expect(imageLayerImage?.getAttribute('source'), imageLayerImageSource);
}

void checkPlan(
  Plan<dynamic> plan, {
  required String hid,
  required List<String> exposedIds,
}) {
  expect(hid.isCorrectHid, true, reason: hid);
  expect(plan.hid, hid);

  expect(plan.uid, isUuid);
  expect(plan.uid == plan.hid, isFalse, reason: '${plan.id} == ${plan.hid}');

  expect(plan.impactsOnPlans.length, exposedIds.length);
  for (final exposedId in exposedIds) {
    final found = plan.impactsOnPlans
        .firstWhereOrNull((p) => (p as HasIdMix).id == exposedId);
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
