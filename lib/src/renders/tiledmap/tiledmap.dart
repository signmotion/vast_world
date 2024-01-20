part of '../../../vast_world.dart';

typedef TiledmapT = ({
  ({String pathToFile, XmlDocument content}) fileXml,
  List<({String pathToFile, Image content})> fileImages,
});

class TiledmapRenderConfigure extends XmlRenderConfigure {
  const TiledmapRenderConfigure({
    this.objectTextWidth = 500,
    this.objectTextHeight = 1000,
    this.indent = 100,
  });

  final int objectTextWidth;
  final int objectTextHeight;

  /// indent between map elements
  final int indent;
}
