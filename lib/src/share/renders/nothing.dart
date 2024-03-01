part of '../../../vast_world_share.dart';

Image nothingImageRender(
  Plan<Plan<dynamic>> spectator,
  Plan<Plan<dynamic>> watched,
  Lore lore,
) =>
    defaultImage(const ImageRenderConfigure());

String nothingStringRender(
  Plan<Plan<dynamic>> spectator,
  Plan<Plan<dynamic>> watched,
  Lore lore,
) =>
    '';

TiledmapT nothingTiledmapTRender(
  Plan<Plan<dynamic>> spectator,
  Plan<Plan<dynamic>> watched,
  Lore lore,
) =>
    (
      fileXml: (pathToFile: '', content: XmlDocument()),
      fileImages: [],
    );

XmlDocument nothingXmlRender(
  Plan<Plan<dynamic>> spectator,
  Plan<Plan<dynamic>> watched,
) =>
    XmlDocument();
