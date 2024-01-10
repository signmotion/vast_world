part of '../../../vast_world.dart';

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

  factory VMap.fromTiledMap(TiledMap tm) => VMap(
        width: tm.width,
        height: tm.height,
        tilesets: tm.tilesets,
        layers: tm.layers,
      );

  static const defaultContentFilename = '_.tmx';
  static const defaultBackgroundFilename =
      VBackgroundImage.defaultBackgroundFilename;

  static const defaultBackgroundImageLayerName =
      VBackgroundLayer.defaultBackgroundImageLayerName;
  static const defaultImageriesLayerName = VImageries.defaultImageriesLayerName;
}
