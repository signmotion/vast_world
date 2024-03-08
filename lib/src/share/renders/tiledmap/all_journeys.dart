part of '../../../../vast_world_share.dart';

TiledmapT allJourneysTiledmapRender(
  Plan spectator,
  Plan watched,
  Lore lore,
) {
  const configure = TiledmapRenderConfigure();

  ({String pathToFile, Image content}) imageryImageRender(
    Plan spectator,
    Plan watched,
    Plan exposedWatched,
  ) =>
      (
        pathToFile: ph.join(
          watched.id,
          'rendered',
          'image',
          exposedWatched.hid,
          VMap.defaultDataImageFilename,
        ),
        content: countExposedImageRender(watched, exposedWatched, lore),
      );

  XmlDocument xmlRender(
    Plan spectator,
    Plan watched,
    List<({String pathToFile, Image content})> imageries,
  ) {
    ae(
        watched.exposedIds.length == imageries.length,
        'Count of exposed into `watched` and'
        ' count imageries should be equals.');

    final id = TransitIdGen();

    // tilesets
    final tileObjects = <VObjectTile>[];
    final tilesets = <VTileset>[];
    var lastY = 0.0;
    for (var i = watched.exposedIds.length - 1; i >= 0; --i) {
      final exposedId = watched.exposedIds[i];
      final imagery = imageries[i];
      final pathToImageryFile = imagery.pathToFile.pathAfterHead;
      final image = imagery.content;

      // all exposed of plan keeps into the specific folder
      // see [imageryImageRender]
      final pictureImage = VPictureImage(
        name: pathToImageryFile,
        width: image.width,
        height: image.height,
      );
      tilesets.add(VTileset(
        name: exposedId,
        tileWidth: image.width,
        tileHeight: image.height,
        image: pictureImage,
        tileCount: 1,
        firstGid: id.next,
      ));

      // align by vertical center
      final x = image.width / 2;
      lastY += image.height + configure.indent;
      tileObjects.add(VObjectTile(
        id: id.next,
        gid: id.current - 1,
        name: exposedId,
        x: x.round(),
        y: lastY.round(),
        width: image.width,
        height: image.height,
      ));
    }

    // packing to layers
    final layers = <Layer>[];

    // exposed as tiles
    if (tileObjects.isNotEmpty) {
      layers.add(VExposedList(
        id: id.next,
        objects: tileObjects,
      ));
    }

    const w = 0;
    const h = 0;
    final map = VMap(
      width: w,
      height: h,
      infinite: w == 0 || h == 0,
      tilesets: tilesets,
      layers: layers,
    );

    return TileMapConverter.convertToTmx(map);
  }

  final imageries = [
    for (final we in watched.exposedIds)
      imageryImageRender(spectator, watched, lore[we]!)
  ];

  return (
    fileXml: (
      pathToFile: ph.join(watched.id, VMap.defaultContentFilename),
      content: xmlRender(spectator, watched, imageries),
    ),
    fileImages: imageries,
  );
}
