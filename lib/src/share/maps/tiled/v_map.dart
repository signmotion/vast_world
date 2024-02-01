part of '../../../../vast_world_share.dart';

class VMap extends TiledMap {
  VMap({
    required super.width,
    required super.height,
    super.infinite = false,
    super.tilesets = const [],
    super.layers = const [],
    JsonMap properties = const {},
  }) : super(
          tileWidth: 1,
          tileHeight: 1,
          version: '1.0',
          tiledVersion: '1.10.2',
          compressionLevel: 9,
          orientation: MapOrientation.orthogonal,
          properties: CustomProperties(
            properties.map(
              (k, v) => MapEntry(
                k,
                Property(
                  name: k,
                  type: PropertyType.string,
                  value: v.toString(),
                ),
              ),
            ),
          ),
        );

  factory VMap.fromTiledMap(TiledMap tm) => VMap(
        width: tm.width,
        height: tm.height,
        infinite: tm.infinite,
        tilesets: tm.tilesets,
        layers: tm.layers,
        properties: tm.properties.byName.map(
          (k, v) => MapEntry(k, v.value),
        ),
      );

  static const defaultContentFilename = '_.tmx';

  static String get defaultPictureFilename =>
      VPictureImage.defaultPictureFilename;

  static const defaultDataImageFilename = 'data.png';

  static const defaultExposedLayerName = VExposedList.defaultExposedLayerName;
}
