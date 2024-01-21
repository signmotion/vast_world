part of '../../../vast_world.dart';

TiledmapT placeTiledmapRender(
  Plan<dynamic> spectator,
  Plan<dynamic> watched,
) {
  const configure = TiledmapRenderConfigure();

  ({String pathToFile, Image content}) pictureComponentImageRender(
    Plan<dynamic> spectator,
    Plan<dynamic> watched,
  ) {
    final picture = watched.get<PictureComponent>();

    return (
      pathToFile: ph.join(watched.id, VMap.defaultPictureFilename),
      content: picture?.image ?? defaultImage(),
    );
  }

  XmlDocument xmlRender(
    Plan<dynamic> spectator,
    Plan<dynamic> watched,
  ) {
    final id = TransitIdGen();

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
    final picture = pictureComponentImageRender(spectator, watched);
    final pathToFile = picture.pathToFile.pathAfterHead;
    final image = picture.content;
    layers.add(VPictureLayer(
      id: id.next,
      name: pathToFile,
      width: image.width,
      height: image.height,
    ));

    // story as text block
    if (story != null && storyObjects.isNotEmpty) {
      layers.add(VConcreteComponent(
        id: id.next,
        name: story.hid,
        objects: storyObjects,
      ));
    }

    final w = image.width;
    final h = image.height;
    final map = VMap(
      width: w,
      height: h,
      infinite: w == 0 || h == 0,
      layers: layers,
    );

    return TileMapConverter.convertToTmx(map);
  }

  final image = pictureComponentImageRender(spectator, watched);

  return (
    fileXml: (
      pathToFile: ph.join(watched.id, VMap.defaultContentFilename),
      content: xmlRender(spectator, watched),
    ),
    fileImages: [image],
  );
}
