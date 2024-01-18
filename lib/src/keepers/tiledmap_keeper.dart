part of '../../vast_world.dart';

abstract class TiledmapKeeper<Q extends Quant, ImgB extends Broker<dynamic>,
    TxtB extends Broker<dynamic>> extends Keeper<Q, ImgB, TxtB> {
  TiledmapKeeper({
    required super.imageBroker,
    required super.textBroker,
    super.readOnly = true,
  });
}

/// For define typed [Keeper] we can use inheritance or this syntax:
/// ```
/// typedef Keeper = PlanTiledmapKeeper<ImageFilesystemBroker, TextFilesystemBroker>;
/// ```
class PlanTiledmapKeeper<P extends Plan<dynamic>, ImgB extends Broker<dynamic>,
    TxtB extends Broker<dynamic>> extends TiledmapKeeper<P, ImgB, TxtB> {
  PlanTiledmapKeeper({
    required super.imageBroker,
    required super.textBroker,
    super.readOnly = true,
  });

  @override
  P? read(String id, [int depth = Keeper.maxReadPlanDepth]) {
    super.read(id, depth);

    throw UnimplementedError();
  }

  @override
  void write(Quant value, [int depth = Keeper.maxWritePlanDepth]) {
    super.write(value, depth);

    _writePlan(value as Plan<dynamic>, depth);
  }

  void _writePlan(
    Plan<dynamic> plan, [
    int depth = Keeper.maxWritePlanDepth,
    String? pathPrefix,
  ]) {
    _writePlanXml(plan, pathPrefix);
    _writePlanPictureComponent(plan, pathPrefix);

    // ! keep all plans to the root; reason: 1 plan can links to some imageries,
    // ! change them & take changes them
    final prefix = pathPrefix;

    // save the imageries as plans
    for (final imagery in plan.imageries) {
      _writePlan(imagery as Plan<dynamic>, depth - 1, prefix);
    }
  }

  void _writePlanXml(Plan<dynamic> plan, [String? pathPrefix]) {
    var id = 0;

    // story
    final storyObjects = <VObjectText>[];
    final story = plan.innerEntity.get<StoryComponent>();
    if (story != null) {
      ++id;
      storyObjects.add(VObjectText(
        id: id,
        name: 'text',
        x: -600,
        y: 0,
        width: 500,
        height: 1000,
        text: story.text,
        wrap: true,
      ));
    }

    // tilesets
    final tilesets = <VImagery>[];
    final tileObjects = <VObjectTile>[];
    var lastY = 0.0;
    final reversedImageries = plan.imageries.reversed.toList();
    for (var i = 0; i < reversedImageries.length; ++i) {
      final imagery = reversedImageries[i] as Plan<dynamic>;

      final rendered = ImageRender(plan, imagery).rendered;
      _writeRendered(rendered);

      final image = rendered.data;

      ++id;
      tilesets.add(VImagery.fromImagery(
        imageryHid: imagery.hid,
        tileWidth: image.width,
        tileHeight: image.height,
        firstGid: id,
      ));

      ++id;
      // align by vertical center
      const wantIndentY = 40;
      final x = image.width / 2;
      lastY += image.height + wantIndentY;
      tileObjects.add(VObjectTile.fromImagery(
        id: id,
        gid: id - 1,
        imagery: imagery,
        x: x.round(),
        y: lastY.round(),
        width: image.width,
        height: image.height,
      ));
    }

    // compact the objects to layers
    final layers = <Layer>[];
    final picture = plan.innerEntity.get<PictureComponent>();
    {
      // picture as background
      if (picture != null) {
        ++id;
        layers.add(VPictureLayer(
          id: id,
          name: picture.hid,
          width: picture.width,
          height: picture.height,
        ));
      }

      // story as text block
      if (story != null && storyObjects.isNotEmpty) {
        ++id;
        layers.add(VConcreteComponent(
          id: id,
          name: story.hid,
          objects: storyObjects,
        ));
      }

      // rendered imageries as tiles
      if (tileObjects.isNotEmpty) {
        ++id;
        layers.add(VImageries(
          id: id,
          objects: tileObjects,
        ));
      }
    }

    final map = VMap(
      width: picture?.width ?? 0,
      height: picture?.height ?? 0,
      infinite: true,
      tilesets: tilesets,
      layers: layers,
    );
    final s = const VConverter(pretty: false).convert(map);
    final pf = ph.join(pathPrefix ?? '', plan.id, VMap.defaultContentFilename);
    textBroker.write(pf, s);
  }

  void _writePlanPictureComponent(Plan<dynamic> plan, [String? pathPrefix]) {
    final picture = plan.innerEntity.get<PictureComponent>();
    if (picture != null) {
      final pf = ph.join(pathPrefix ?? '', plan.id, '${picture.hid}.png');
      imageBroker.write(pf, picture.image);
    }
  }

  void _writeRendered(ImageRenderedData rendered) {
    final pf = ph.join(
      rendered.spectatorId,
      'rendered',
      'image',
      rendered.watchedId,
      'data.png',
    );
    imageBroker.write(pf, rendered.data);
  }
}
