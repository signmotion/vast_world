part of '../../../vast_world.dart';

class DEPRECATED_XmlRenderComponent extends RenderComponent<XmlDocument> {
  @override
  RenderFn<XmlDocument> get empty => nothingXmlRender;

  @override
  RenderFn<XmlDocument> get render => value;
}
