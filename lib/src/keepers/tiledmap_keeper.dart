import 'package:dart_helpers/dart_helpers.dart';
import 'package:dart_tiledmap/dart_tiledmap.dart';

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

    throw Exception('Not implemented');
  }

  @override
  void write(Plan2D<int> value) {
    // final plan = value;

    // final tilesets = <Tileset>[];
    // for (final imagery in plan.imageries) {
    //   final (isx, isy) = plan.axisSizeImagery(imagery);
    //   final tileset = Tileset(
    //     name: imagery.id,
    //     tileWidth: imagery.bgWidth,
    //     tileHeight: imagery.bgHeight,
    //     image: TiledImage(source: imagery.npath, width: isx, height: isy),
    //     tileCount: 1,
    //   );
    //   tilesets.add(tileset);
    // }

    // final layers = <Layer>[];
    // var id = 0;
    // {
    //   ++id;
    //   final tiledImage = TiledImage(
    //     source: 'bg.png',
    //     width: plan.axisWidth,
    //     height: plan.axisHeight,
    //   );
    //   layers.add(ImageLayer(
    //     id: id,
    //     name: 'bg',
    //     image: tiledImage,
    //     repeatX: false,
    //     repeatY: false,
    //   ));
    // }
    // {
    //   ++id;
    //   layers.add(ObjectGroup(
    //     id: id,
    //     name: 'imageries',
    //     objects: [TiledObject(id: id, name: imagery.id)],
    //   ));
    // }

    // final tmx = TiledMap(
    //   width: plan.axisWidth,
    //   height: plan.axisHeight,
    //   tileWidth: 1,
    //   tileHeight: 1,
    //   version: '0.1',
    //   tiledVersion: '1.10.2',
    //   tilesets: tilesets,
    //   layers: layers,
    //   compressionLevel: 9,
    //   orientation: MapOrientation.orthogonal,
    // );
    // print(tmx.toString());

    throw Exception('Not implemented');
  }
}
