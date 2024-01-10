part of '../../vast_world.dart';

abstract class TiledmapKeeper<Q extends Quant, ImgB extends Broker<dynamic>,
    TxtB extends Broker<dynamic>> extends Keeper<Q, ImgB, TxtB> {
  TiledmapKeeper({
    required super.imageBroker,
    required super.textBroker,
  });

  @override
  bool exists(String id) => imageBroker.exists(id) || textBroker.exists(id);
}

abstract class QuantTiledmapKeeper<
    Q extends Quant,
    ImgB extends Broker<dynamic>,
    TxtB extends Broker<dynamic>> extends TiledmapKeeper<Q, ImgB, TxtB> {
  QuantTiledmapKeeper({
    required super.imageBroker,
    required super.textBroker,
  });
}

class Plan2DIntTiledmapKeeper<ImgB extends Broker<dynamic>,
        TxtB extends Broker<dynamic>>
    extends QuantTiledmapKeeper<Plan2D<int>, ImgB, TxtB> {
  Plan2DIntTiledmapKeeper({
    required super.imageBroker,
    required super.textBroker,
  });

  @override
  Plan2D<int>? read(String id) {
    final body = textBroker.read(id);
    if (body == null) {
      return null;
    }

    if (body is! String) {
      throw ArgumentError('Expected a string data'
          ' instead of `${body.runtimeType}`.');
    }

    final map = const VParser().parse(body);
    // final pathToBackground = map.layers.firstWhere((layer) => layer is )

    // final plan = Plan2D<int>(
    //   pathToBackground,
    //   realWidth: realWidth,
    //   realHeight: realHeight,
    //   anchor: anchor,
    //   axisType: axisType,
    //   scale: scale,
    //   innerDataDefaultValue: innerDataDefaultValue,
    //   outerDataDefaultValue: outerDataDefaultValue,
    // );

    throw UnimplementedError();
  }

  @override
  void write(Plan2D<int> value) {
    final plan = value;
    _writePlanXml(plan);
    _writePlanBackground(plan);
    _writePlanImageries(plan);
  }

  void _writePlanXml(Plan2D<int> plan) {
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

  void _writePlanBackground(Plan2D<int> plan) {
    final pf = ph.join(plan.id, VMap.defaultBackgroundFilename);
    imageBroker.write(pf, plan.background.image);
  }

  void _writePlanImageries(Plan2D<int> plan) {
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
