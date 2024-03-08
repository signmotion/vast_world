part of '../../../vast_world_share.dart';

Image nothingImageRender(
  Plan spectator,
  Plan watched,
  Lore lore,
) =>
    defaultImage(const ImageRenderConfigure());

String nothingStringRender(
  Plan spectator,
  Plan watched,
  Lore lore,
) =>
    '';

TiledmapT nothingTiledmapTRender(
  Plan spectator,
  Plan watched,
  Lore lore,
) =>
    (
      fileXml: (pathToFile: '', content: XmlDocument()),
      fileImages: [],
    );

XmlDocument nothingXmlRender(
  Plan spectator,
  Plan watched,
) =>
    XmlDocument();
