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

    final scale = map.properties.getValue('scale') as double? ?? 1.0;
    final realWidth = map.width * scale;
    final realHeight = map.height * scale;

    final sUnitType = map.properties.getValue('unit_type') as String? ?? '';
    final unitType =
        UnitType.values.findByName(sUnitType, defaults: UnitType.undefined)!;

    final sAxisType = map.properties.getValue('axis_type') as String? ?? '';
    final axisType =
        AxisType.values.findByName(sAxisType, defaults: AxisType.undefined)!;

    return Plan2D<T>(
      path,
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
  void write(Plan2D<T> value) {
    final plan = value;
    _writePlanXml(plan);
    _writePlanBackground(plan);
    _writePlanImageries(plan);
  }

  void _writePlanXml(Plan2D<T> plan) {
    var id = 0;

    final tilesets = <VImagery>[];
    final objects = <VTile>[];
    for (final imagery in plan.imageries) {
      ++id;
      tilesets.add(VImagery.fromParentAndImagery(
        planId: plan.id,
        parent: plan,
        imagery: imagery,
        firstGid: id,
      ));

      ++id;
      objects.add(VTile.fromImagery(
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

      ++id;
      layers.add(VImageries(
        id: id,
        objects: objects,
      ));
    }

    final map = VMap(
      width: plan.axisWidth,
      height: plan.axisHeight,
      tilesets: tilesets,
      layers: layers,
    );
    final s = const VConverter().convert(map);
    final pf = ph.join(plan.id, VMap.defaultContentFilename);
    textBroker.write(pf, s);
  }

  void _writePlanBackground(Plan2D<T> plan) {
    final pf = ph.join(plan.id, VMap.defaultBackgroundFilename);
    imageBroker.write(pf, plan.background.image);
  }

  void _writePlanImageries(Plan2D<T> plan) {
    for (final imagery in plan.imageries) {
      _writePlanImagery(plan.id, imagery);
    }
  }

  void _writePlanImagery(String planId, Imagery imagery) {
    _writePlanImageryXml(planId, imagery);
    _writePlanImageryBackground(planId, imagery);
  }

  void _writePlanImageryXml(String planId, Imagery imagery) {
    var id = 0;

    final layers = <Layer>[];
    {
      ++id;
      layers.add(VBackgroundLayer(
        id: id,
        width: imagery.axisWidth,
        height: imagery.axisHeight,
      ));
    }

    final map = VMap(
      width: imagery.axisWidth,
      height: imagery.axisHeight,
      layers: layers,
    );
    final s = const VConverter().convert(map);
    final pf = ph.join(planId, imagery.id, VMap.defaultContentFilename);
    textBroker.write(pf, s);
  }

  void _writePlanImageryBackground(String planId, Imagery imagery) {
    final pf = ph.join(planId, imagery.id, VMap.defaultBackgroundFilename);
    imageBroker.write(pf, imagery.background.image);
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
