part of '../../vast_world.dart';

class XmlTiledmapRenderConfigure extends XmlRenderConfigure {
  const XmlTiledmapRenderConfigure({
    this.objectTextWidth = 500,
    this.objectTextHeight = 1000,
    this.indent = 100,
  });

  final int objectTextWidth;
  final int objectTextHeight;

  /// indent between map elements
  final int indent;
}

class XmlTiledmapRenderedData extends XmlRenderedData {
  const XmlTiledmapRenderedData(
    super.spectatorId,
    super.watchedId, {
    required super.data,
  });
}

XmlDocument defaultXmlTiledmapDocument(XmlTiledmapRenderConfigure configure) =>
    XmlDocument();
