part of '../../../vast_world.dart';

class VImage extends TiledImage {
  const VImage({
    required super.source,
    required super.width,
    required super.height,
  });
}

class VBackgroundImage extends VPictureImage {
  const VBackgroundImage({
    super.pathPrefix = '',
    required super.width,
    required super.height,
  }) : super(name: defaultBackgroundFilename);

  static const defaultBackgroundFilename =
      '${VBackgroundLayer.defaultBackgroundImageLayerName}.png';
}

class VPictureImage extends VImage {
  const VPictureImage({
    String pathPrefix = '',
    required String name,
    required super.width,
    required super.height,
  }) : super(source: '$pathPrefix/$name.png');
}
