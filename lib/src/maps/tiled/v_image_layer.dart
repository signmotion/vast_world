part of '../../../vast_world.dart';

class VImageLayer extends ImageLayer {
  VImageLayer({
    required super.id,
    required super.name,
    required super.image,
  }) : super(
          repeatX: false,
          repeatY: false,
        );
}

class VBackgroundLayer extends VPictureLayer {
  VBackgroundLayer({
    required super.id,
    required super.width,
    required super.height,
  }) : super(name: defaultBackgroundImageLayerName);

  static const defaultBackgroundImageLayerName = 'bg';
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

  static const defaultPictureImageLayerName = 'picture';
}
