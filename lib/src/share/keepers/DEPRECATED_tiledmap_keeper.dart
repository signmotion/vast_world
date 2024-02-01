part of '../../../vast_world_share.dart';

// /// For define typed [Keeper] we can use inheritance or this syntax:
// /// ```
// /// typedef Plan = Plan2D<int>;
// /// typedef Keeper = Plan2DTiledmapKeeper<int, ImageFilesystemBroker, TextFilesystemBroker>;
// /// ```
// abstract class TiledmapKeeper<
//     Q extends DEPRECATED_Quant,
//     ImgB extends Broker<dynamic>,
//     TxtB extends Broker<dynamic>> extends Keeper<Q, ImgB, TxtB> {
//   TiledmapKeeper({
//     required super.imageBroker,
//     required super.textBroker,
//     super.readOnly = true,
//   });
// }

// /// For define typed [Keeper] we can use this syntax:
// /// ```
// /// typedef Keeper = Plan2DTiledmapKeeper<int, ImageFilesystemBroker, TextFilesystemBroker>;
// /// ```
// class Plan2DTiledmapKeeper<C extends Content, ImgB extends Broker<dynamic>,
//         TxtB extends Broker<dynamic>>
//     extends TiledmapKeeper<DEPRECATED_Plan2D<C>, ImgB, TxtB> {
//   Plan2DTiledmapKeeper({
//     required super.imageBroker,
//     required super.textBroker,
//     super.readOnly = true,
//   });

//   @override
//   DEPRECATED_Plan2D<C>? read(String id) {
//     final path = ph.joinAll([...id.hidToList, VMap.defaultContentFilename]);
//     final body = textBroker.read(path);
//     if (body == null) {
//       return null;
//     }

//     if (body is! String) {
//       throw ArgumentError('Expected a string data'
//           ' instead of `${body.runtimeType}`.');
//     }

//     final map = const VParser().parse(body);

//     // will use the constructed [path] above
//     // // final imageLayer =
//     // //     map.layers.firstWhere((layer) => layer is ImageLayer) as ImageLayer;
//     // // final pathToBackground = imageLayer.image.source!;

//     final sScale = map.properties.getValue<String>('scale') ?? '';
//     final scale = double.tryParse(sScale) ?? 1.0;

//     // also we have same sizes into [map.properties]
//     final realWidth = map.width * scale;
//     final realHeight = map.height * scale;

//     final sUnitType = map.properties.getValue<String>('unit_type') ?? '';
//     final unitType =
//         UnitType.values.findByName(sUnitType, defaults: UnitType.undefined)!;

//     final sAxisType = map.properties.getValue<String>('axis_type') ?? '';
//     final axisType =
//         AxisType.values.findByName(sAxisType, defaults: AxisType.undefined)!;

//     final shape = _getShapeFromMap(map) ?? const InfinityShape();
//     final imageries = _getImageriesFromMap(id, map);

//     // TODO
//     final content = Cell2DContent(size: (map.width, map.height), defaults: 0);

//     var plan = DEPRECATED_Plan2D<C>(
//       textBroker.pathPrefix,
//       id,
//       realWidth: Unit(realWidth, unitType),
//       realHeight: Unit(realHeight, unitType),
//       anchor: Anchor2D.topLeft,
//       axisType: axisType,
//       scale: scale,
//       shape: shape,
//       imageries: imageries,
//       content: content,
//     );

//     return plan;
//   }

//   List<DEPRECATED_Imagery> _getImageriesFromMap(String planHid, VMap map) {
//     // we can have a map (and plan) without imageries
//     late final Layer? layer;
//     try {
//       layer = map.layerByName('imageries');
//     } on ArgumentError catch (_) {
//       return [];
//     }

//     if (layer is! ObjectGroup) {
//       throw Exception('Layer named as `imageries` should be an ObjectGroup.');
//     }

//     final imageries = <DEPRECATED_Imagery>[];
//     for (final o in layer.objects) {
//       if (!o.isTile) {
//         continue;
//       }

//       final oname = o.name.trim();
//       if (oname.isEmpty) {
//         throw Exception('Imagery `${o.id}` should be named.');
//       }

//       // load a plan with this imagery
//       final imageryHid = [planHid, oname].listToHid;
//       final iplan = readImageryToPlan(imageryHid);
//       if (iplan == null) {
//         throw Exception('The plan file for imagery `$imageryHid`'
//             ' into the plan `$planHid` is not found.');
//       }

//       // convert the loaded plan to imagery for parent plan
//       final imagery = iplan.toPictureImagery(
//         parentPlanHid: planHid,
//         axisPositionInParentPlan: (o.x.round(), o.y.round()),
//       );
//       imageries.add(imagery);
//     }

//     return imageries;
//   }

//   static Shape2D? _getShapeFromMap(VMap map) {
//     // we can have a map (and plan) without shape
//     late final Layer? layer;
//     try {
//       layer = map.layerByName('shape');
//     } on ArgumentError catch (_) {
//       return null;
//     }

//     if (layer is! ObjectGroup) {
//       throw Exception('Layer named as `shape` should be an ObjectGroup.');
//     }

//     if (layer.objects.length != 1) {
//       throw Exception('The layer should be 1. Found: ${layer.objects.length}.');
//     }

//     final o = layer.objects.single;
//     if (!o.isPolygon) {
//       throw Exception('The layer `shape` should contain a polygon.'
//           ' Contain: $o.');
//     }

//     final vertices = <Vector2>[];
//     final centerX = o.x;
//     final centerY = o.y;
//     for (final p in o.polygon) {
//       final v = Vector2(p.x + centerX, p.y + centerY);
//       vertices.add(v);

//       ae(
//         v.x >= 0 && v.x <= map.width,
//         'Polygon is out of map. x == ${v.x},'
//         ' map widht = ${map.width}',
//       );
//       ae(
//         v.y >= 0 && v.y <= map.height,
//         'Polygon is out of map. y == ${v.y},'
//         ' map height = ${map.height}',
//       );
//     }

//     return PolygonShape.fromList(vertices);
//   }

//   DEPRECATED_Plan2D<C>? readImageryToPlan(String imageryHid) {
//     assert(imageryHid.isCorrectImageryHid,
//         'Imagery HID should contain a plan HID.');

//     return read(imageryHid);
//   }

//   @override
//   void write(DEPRECATED_Plan2D<C> value) {
//     super.write(value);

//     _writePlan(value);
//   }

//   void _writePlan(DEPRECATED_Plan2D<C> plan, [String? pathPrefix]) {
//     _writePlanXml(plan, pathPrefix);
//     _writePlanBackground(plan, pathPrefix);

//     final prefix = ph.join(pathPrefix ?? '', plan.hid);

//     // convert the imageries to plans and save them
//     for (final imagery in plan.imageries) {
//       final pl = DEPRECATED_Plan2D<C>.imageryToPlan(plan, imagery);
//       _writePlan(pl, prefix);
//     }
//   }

//   void _writePlanXml(DEPRECATED_Plan2D<C> plan, [String? pathPrefix]) {
//     var id = 0;

//     final tilesets = <VImagery>[];
//     final objects = <VObjectTile>[];
//     for (final imagery in plan.imageries) {
//       ++id;
//       tilesets.add(VImagery.fromImagery(
//         planId: plan.id,
//         imagery: imagery,
//         firstGid: id,
//       ));

//       ++id;
//       objects.add(VObjectTile.fromParentAndImagery(
//         parent: plan,
//         id: id,
//         gid: id - 1,
//         imagery: imagery,
//       ));
//     }

//     final layers = <Layer>[];
//     {
//       ++id;
//       layers.add(VBackgroundLayer(
//         id: id,
//         width: plan.axisWidth,
//         height: plan.axisHeight,
//       ));

//       if (objects.isNotEmpty) {
//         ++id;
//         layers.add(VImageries(
//           id: id,
//           objects: objects,
//         ));
//       }
//     }

//     final properties = <String, dynamic>{
//       'scale': plan.scale,
//       'unit_type': plan.realWidth.type.name,
//       'axis_type': plan.axisType.name,
//       // should be equal [axisWidth * scale]
//       'real_width': plan.realWidth.value,
//       // should be equal [axisHeight * scale]
//       'real_height': plan.realHeight.value,
//     };

//     final map = VMap(
//       width: plan.axisWidth,
//       height: plan.axisHeight,
//       tilesets: tilesets,
//       layers: layers,
//       properties: properties,
//     );
//     final s = const VConverter().convert(map);
//     final pf = ph.join(pathPrefix ?? '', plan.id, VMap.defaultContentFilename);
//     textBroker.write(pf, s);
//   }

//   void _writePlanBackground(DEPRECATED_Plan2D<C> plan, [String? pathPrefix]) {
//     final pf =
//         ph.join(pathPrefix ?? '', plan.id, VMap.defaultBackgroundFilename);
//     imageBroker.write(pf, plan.background.image);
//   }
// }
