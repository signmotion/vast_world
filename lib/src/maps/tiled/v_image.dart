part of '../../../vast_world.dart';

class VImage extends TiledImage {
  const VImage({
    required super.source,
    required super.width,
    required super.height,
  });
}

class VPictureImage extends VImage {
  VPictureImage({
    required String name,
    required super.width,
    required super.height,
  }) : super(source: '${ph.withoutExtension(name)}.png');

  static String get defaultPictureFilename =>
      '${VPictureLayer.defaultPictureImageLayerName}.png';
}
