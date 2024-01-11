part of '../../vast_world.dart';

/// For define typed [Keeper] we can use inheritance or this syntax:
/// ```
/// typedef Plan = Plan2D<int>;
/// typedef Keeper = TiledmapKeeper<Plan, ImageFilesystemBroker, TextFilesystemBroker>;
/// ```
abstract class TiledmapKeeper<Q extends Quant, ImgB extends Broker<dynamic>,
    TxtB extends Broker<dynamic>> extends Keeper<Q, ImgB, TxtB> {
  TiledmapKeeper({
    required super.imageBroker,
    required super.textBroker,
  });
}

/// For define typed [Keeper] we can use this syntax:
/// ```
/// typedef Keeper = Plan2DTiledmapKeeper<int, ImageFilesystemBroker, TextFilesystemBroker>;
/// ```
class Plan2DTiledmapKeeper<T, ImgB extends Broker<dynamic>,
        TxtB extends Broker<dynamic>>
    extends TiledmapKeeper<Plan2D<T>, ImgB, TxtB> {
  Plan2DTiledmapKeeper({
    required super.imageBroker,
    required super.textBroker,
  });

  @override
  Plan2D<T>? read(String id) {
    final path = ph.join(id, VMap.defaultContentFilename);
    final body = textBroker.read(path);
    if (body == null) {
      return null;
    }

    if (body is! String) {
      throw ArgumentError('Expected a string data'
          ' instead of `${body.runtimeType}`.');
    }

    final map = const VParser().parse(body);

    // will use the constructed [path] above
    // // final imageLayer =
    // //     map.layers.firstWhere((layer) => layer is ImageLayer) as ImageLayer;
    // // final pathToBackground = imageLayer.image.source!;

    final sScale = map.properties.getValue<String>('scale') ?? '';
    final scale = double.tryParse(sScale) ?? 1.0;

    // also we have same sizes into [map.properties]
    final realWidth = map.width * scale;
    final realHeight = map.height * scale;

    final sUnitType = map.properties.getValue<String>('unit_type') ?? '';
    final unitType =
        UnitType.values.findByName(sUnitType, defaults: UnitType.undefined)!;

    final sAxisType = map.properties.getValue<String>('axis_type') ?? '';
    final axisType =
        AxisType.values.findByName(sAxisType, defaults: AxisType.undefined)!;

    return Plan2D<T>(
      textBroker.pathPrefix,
      id,
      realWidth: Unit(realWidth, unitType),
      realHeight: Unit(realHeight, unitType),
      anchor: Anchor2D.topLeft,
      axisType: axisType,
      scale: scale,
      innerDataDefaultValue: 1 as T,
      outerDataDefaultValue: 0 as T,
    );
  }

  @override
  void write(Plan2D<T> value) => _writePlan(value);

  void _writePlan(Plan2D<T> plan, [String? pathPrefix]) {
    _writePlanXml(plan, pathPrefix);
    _writePlanBackground(plan, pathPrefix);

    final prefix = ph.join(pathPrefix ?? '', plan.hid);

    // convert the imageries to plans and save them
    for (final imagery in plan.imageries) {
      final pl = Plan2D<T>.imageryToPlan(plan, imagery);
      _writePlan(pl, prefix);
    }
  }

  void _writePlanXml(Plan2D<T> plan, [String? pathPrefix]) {
    var id = 0;

    final tilesets = <VImagery>[];
    final objects = <VObjectTile>[];
    for (final imagery in plan.imageries) {
      ++id;
      tilesets.add(VImagery.fromImagery(
        planId: plan.id,
        imagery: imagery,
        firstGid: id,
      ));

      ++id;
      objects.add(VObjectTile.fromParentAndImagery(
        parent: plan,
        id: id,
        gid: id - 1,
        imagery: imagery,
      ));
    }

    final layers = <Layer>[];
    {
      ++id;
      layers.add(VBackgroundLayer(
        id: id,
        width: plan.axisWidth,
        height: plan.axisHeight,
      ));

      if (objects.isNotEmpty) {
        ++id;
        layers.add(VImageries(
          id: id,
          objects: objects,
        ));
      }
    }

    final properties = <String, dynamic>{
      'scale': plan.scale,
      'unit_type': plan.realWidth.type.name,
      'axis_type': plan.axisType.name,
      // should be equal [axisWidth * scale]
      'real_width': plan.realWidth.value,
      // should be equal [axisHeight * scale]
      'real_height': plan.realHeight.value,
    };

    final map = VMap(
      width: plan.axisWidth,
      height: plan.axisHeight,
      tilesets: tilesets,
      layers: layers,
      properties: properties,
    );
    final s = const VConverter().convert(map);
    final pf = ph.join(pathPrefix ?? '', plan.id, VMap.defaultContentFilename);
    textBroker.write(pf, s);
  }

  void _writePlanBackground(Plan2D<T> plan, [String? pathPrefix]) {
    final pf =
        ph.join(pathPrefix ?? '', plan.id, VMap.defaultBackgroundFilename);
    imageBroker.write(pf, plan.background.image);
  }
}

class Plan2DIntTiledmapKeeper<ImgB extends Broker<dynamic>,
        TxtB extends Broker<dynamic>>
    extends Plan2DTiledmapKeeper<int, ImgB, TxtB> {
  Plan2DIntTiledmapKeeper({
    required super.imageBroker,
    required super.textBroker,
  });
}
