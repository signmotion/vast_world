part of '../../../vast_world.dart';

class ImageRenderComponent extends RenderComponent<Image> {
  @override
  RenderFn<Image> get empty => nothingImageRender;

  @override
  RenderFn<Image> get render => value!;
}
