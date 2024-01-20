part of '../../../vast_world.dart';

class VImageLayer extends ImageLayer {
  VImageLayer({
    required super.id,
    required String name,
    required super.image,
  }) : super(
          name: ph.withoutExtension(name),
          repeatX: false,
          repeatY: false,
        );
}

class VPictureLayer extends VImageLayer {
  VPictureLayer({
    required super.id,
    required super.name,
    required int width,
    required int height,
  }) : super(
          image: VPictureImage(
            name: name,
            width: width,
            height: height,
          ),
        );

  static String get defaultPictureImageLayerName => PictureComponent().hid;
}
