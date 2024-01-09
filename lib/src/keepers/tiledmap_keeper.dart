import 'package:dart_tiledmap/dart_tiledmap.dart';
import 'package:path/path.dart' as p;

import '../brokers/broker.dart';
import '../imageries/imagery.dart';
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

    final tilesets = <Tileset>[];
    final objects = <TiledObject>[];
    for (final imagery in plan.imageries) {
      ++id;
      final (isx, isy) = plan.axisSizeImagery(imagery);
      final tiledImage = TiledImage(
        source: imagery.npath,
        width: isx,
        height: isy,
      );
      final tileset = Tileset(
        firstGid: id,
        name: imagery.id,
        tileWidth: imagery.axisWidth,
        tileHeight: imagery.axisHeight,
        image: tiledImage,
        tileCount: 1,
      );
      tilesets.add(tileset);

      ++id;
      final tiledObject = TiledObject(
        id: id,
        gid: id - 1,
        name: imagery.id,
        x: imagery.positionX.toDouble(),
        y: imagery.positionY.toDouble(),
        width: imagery.axisWidth.toDouble(),
        height: imagery.axisHeight.toDouble(),
        tile: true,
      );
      objects.add(tiledObject);
    }

    final layers = <Layer>[];
    {
      ++id;
      final tiledImage = TiledImage(
        source: 'bg.png',
        width: plan.axisWidth,
        height: plan.axisHeight,
      );
      layers.add(ImageLayer(
        id: id,
        name: 'bg',
        image: tiledImage,
        repeatX: false,
        repeatY: false,
      ));
    }
    {
      ++id;
      layers.add(ObjectGroup(
        id: id,
        name: 'imageries',
        objects: objects,
      ));
    }

    final tm = TiledMap(
      width: plan.axisWidth,
      height: plan.axisHeight,
      tileWidth: 1,
      tileHeight: 1,
      version: '0.1',
      tiledVersion: '1.10.2',
      tilesets: tilesets,
      layers: layers,
      compressionLevel: 9,
      orientation: MapOrientation.orthogonal,
    );
    final doc = TileMapConverter.convertToTmx(tm);

    final s = doc.toXmlString(pretty: true);
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
      final tiledImage = TiledImage(
        source: 'bg.png',
        width: imagery.axisWidth,
        height: imagery.axisHeight,
      );
      layers.add(ImageLayer(
        id: id,
        name: 'bg',
        image: tiledImage,
        repeatX: false,
        repeatY: false,
      ));
    }

    final tm = TiledMap(
      width: imagery.axisWidth,
      height: imagery.axisHeight,
      tileWidth: 1,
      tileHeight: 1,
      version: '0.1',
      tiledVersion: '1.10.2',
      layers: layers,
      compressionLevel: 9,
      orientation: MapOrientation.orthogonal,
    );
    final doc = TileMapConverter.convertToTmx(tm);

    final s = doc.toXmlString(pretty: true);
    final pf = p.join(planId, imagery.id, '_.tmx');
    textBroker.write(pf, s);
  }

  void _writePlanImageryBackground(String planId, Imagery imagery) {
    final pf = p.join(planId, imagery.id, 'bg.png');
    imageBroker.write(pf, imagery.background.image);
  }
}
