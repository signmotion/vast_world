import 'package:dart_tiledmap/dart_tiledmap.dart';
import 'package:path/path.dart' as p;

import '../brokers/broker.dart';
import '../imageries/imagery.dart';
import '../maps/tiled/v_converter.dart';
import '../maps/tiled/v_image_layer.dart';
import '../maps/tiled/v_map.dart';
import '../maps/tiled/v_object.dart';
import '../maps/tiled/v_object_group.dart';
import '../maps/tiled/v_tileset.dart';
import '../plan2d.dart';
import '../quant.dart';
import 'keeper.dart';

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

    final tmx = TileMapParser.parseTmx(body);

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

    final tilesets = <VImageryTileset>[];
    final objects = <VTileObject>[];
    for (final imagery in plan.imageries) {
      ++id;
      final tileset = VImageryTileset.fromPlanAndImagery(
        plan: plan,
        imagery: imagery,
        firstGid: id,
      );
      tilesets.add(tileset);

      ++id;
      final tiledObject = VTileObject.fromImagery(
        id: id,
        gid: id - 1,
        imagery: imagery,
      );
      objects.add(tiledObject);
    }

    final layers = <Layer>[];
    {
      ++id;
      layers.add(VBackgroundImageLayer(
        id: id,
        width: plan.axisWidth,
        height: plan.axisHeight,
      ));
    }
    {
      ++id;
      layers.add(VImageryObjectGroup(
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
    final pf = p.join(plan.id, '_.tmx');
    textBroker.write(pf, s);
  }

  void _writePlanBackground(Plan2D<int> plan) {
    final pf = p.join(plan.id, 'bg.png');
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
      layers.add(VBackgroundImageLayer(
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
    final pf = p.join(planId, imagery.id, '_.tmx');
    textBroker.write(pf, s);
  }

  void _writePlanImageryBackground(String planId, Imagery imagery) {
    final pf = p.join(planId, imagery.id, 'bg.png');
    imageBroker.write(pf, imagery.background.image);
  }
}
