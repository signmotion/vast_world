part of '../../../vast_world.dart';

TiledmapT placeTiledmapRender(
  Plan<dynamic> spectator,
  Plan<dynamic> watched,
) {
  const configure = TiledmapRenderConfigure();

  Image pictureLayerImageRender(
    Plan<dynamic> spectator,
    Plan<dynamic> watched,
  ) {
    final picture = watched.get<PictureComponent>();

    return picture?.image ?? defaultImage();
  }

  XmlDocument xmlRender(
    Plan<dynamic> spectator,
    Plan<dynamic> watched,
  ) {
    final id = TransitIdGen();

    // picture as background
    final picture = watched.get<PictureComponent>();

    // story as text object
    final storyObjects = <VObjectText>[];
    final story = watched.get<StoryComponent>();
    if (story != null) {
      storyObjects.add(VObjectText(
        id: id.next,
        name: 'text',
        x: -configure.objectTextWidth - configure.indent,
        y: 0,
        width: configure.objectTextWidth,
        height: configure.objectTextHeight,
        text: story.text,
        wrap: true,
      ));
    }

    // packing to layers
    final layers = <Layer>[];

    // picture as background
    if (picture != null) {
      layers.add(VPictureLayer(
        id: id.next,
        name: picture.hid,
        width: picture.width,
        height: picture.height,
      ));
    }

    // story as text block
    if (story != null && storyObjects.isNotEmpty) {
      layers.add(VConcreteComponent(
        id: id.next,
        name: story.hid,
        objects: storyObjects,
      ));
    }

    final w = picture?.width ?? 0;
    final h = picture?.height ?? 0;
    final map = VMap(
      width: w,
      height: h,
      infinite: w == 0 || h == 0,
      layers: layers,
    );

    return TileMapConverter.convertToTmx(map);
  }

  return (
    fileXml: (
      pathToFile: ph.join(watched.id, VMap.defaultContentFilename),
      content: xmlRender(spectator, watched),
    ),
    fileImages: [
      (
        pathToFile: ph.join(watched.id, VMap.defaultPictureFilename),
        content: pictureLayerImageRender(spectator, watched),
      ),
    ],
  );
}
