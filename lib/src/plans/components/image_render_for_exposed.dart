part of '../../../vast_world.dart';

class ImageRenderForExposedComponent extends RenderComponent<Image> {
  @override
  RenderFn<Image> get empty => nothingImageRender;

  @override
  RenderFn<Image> get render => value!;
}
