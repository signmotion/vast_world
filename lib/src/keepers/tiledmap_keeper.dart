import 'package:dart_tiledmap/dart_tiledmap.dart';
import 'package:path/path.dart' as p;

import '../brokers/broker.dart';
import '../plan2d.dart';
import '../quant.dart';
import 'keeper.dart';

abstract class TiledmapKeeper<Q extends Quant, T, B extends Broker<T>>
    extends Keeper<Q, B> {
  TiledmapKeeper(super.broker);

  @override
  bool exists(String id) => broker.exists(id);
}

abstract class QuantTiledmapKeeper<Q extends Quant, T, B extends Broker<T>>
    extends TiledmapKeeper<Q, T, B> {
  QuantTiledmapKeeper(super.broker);
}

class Plan2DIntTiledmapKeeper<T, B extends Broker<T>>
    extends QuantTiledmapKeeper<Plan2D<int>, T, B> {
  Plan2DIntTiledmapKeeper(super.broker);

  @override
  Plan2D<int>? read(String id) {
    final body = broker.read(id);
    if (body == null) {
      return null;
    }

    if (body is! String) {
      throw Exception('Expected a string data'
          ' instead of `${body.runtimeType}`.');
    }

    final tmx = TileMapParser.parseTmx(body);

    throw UnimplementedError();
  }

  @override
  void write(Plan2D<int> value) {
    final plan = value;

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
    final r = doc.toXmlString(pretty: true);

    final pf = p.join(plan.id, '_.tmx');
    broker.write(pf, r as T);
  }
}
