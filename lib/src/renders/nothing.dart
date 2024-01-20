part of '../../vast_world.dart';

Image nothingImageRender(
  Plan<dynamic> spectator,
  Plan<dynamic> watched,
) =>
    defaultImage(const ImageRenderConfigure());

String nothingStringRender(
  Plan<dynamic> spectator,
  Plan<dynamic> watched,
) =>
    '';

TiledmapT nothingTiledmapTRender(
  Plan<dynamic> spectator,
  Plan<dynamic> watched,
) =>
    (
      fileXml: (pathToFile: '', content: XmlDocument()),
      fileImages: [],
    );

XmlDocument nothingXmlRender(
  Plan<dynamic> spectator,
  Plan<dynamic> watched,
) =>
    XmlDocument();
