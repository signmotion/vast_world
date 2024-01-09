import 'package:dart_tiledmap/dart_tiledmap.dart';

class VMap extends TiledMap {
  VMap({
    required super.width,
    required super.height,
    super.tilesets = const [],
    super.layers = const [],
  }) : super(
          tileWidth: 1,
          tileHeight: 1,
          version: '1.0',
          tiledVersion: '1.10.2',
          compressionLevel: 9,
          orientation: MapOrientation.orthogonal,
        );
}
