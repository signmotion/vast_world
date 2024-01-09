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

class VBackgroundImageLayer extends VImageLayer {
  VBackgroundImageLayer({
    required super.id,
    required int width,
    required int height,
  }) : super(
          name: defaultBackgroundImageLayerName,
          image: VBackgroundImage(
            width: width,
            height: height,
          ),
        );

  static const defaultBackgroundImageLayerName = 'bg';
}
