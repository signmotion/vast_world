part of '../../../vast_world.dart';

class VImage extends TiledImage {
  const VImage({
    required super.source,
    required super.width,
    required super.height,
  });
}

class VBackgroundImage extends VImage {
  const VBackgroundImage({
    String pathPrefix = '',
    required super.width,
    required super.height,
  }) : super(
          source: pathPrefix.length == 0
              ? defaultBackgroundFilename
              : '$pathPrefix/$defaultBackgroundFilename',
        );

  static const defaultBackgroundFilename = 'bg.png';
}
