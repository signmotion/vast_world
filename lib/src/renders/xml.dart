part of '../../vast_world.dart';

class XmlRenderConfigure extends RenderConfigure {
  const XmlRenderConfigure();
}

class XmlRenderedData extends RenderedData<XmlDocument> {
  const XmlRenderedData(
    super.spectatorId,
    super.watchedId, {
    required super.data,
  });
}

XmlDocument defaultXmlDocument(XmlRenderConfigure configure) => XmlDocument();
