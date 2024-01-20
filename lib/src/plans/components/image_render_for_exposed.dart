part of '../../../vast_world.dart';

class DEPRECATED_ImageRenderForExposedComponent extends RenderComponent<Image> {
  @override
  RenderFn<Image> get empty => nothingImageRender;

  @override
  RenderFn<Image> get render => value;
}
