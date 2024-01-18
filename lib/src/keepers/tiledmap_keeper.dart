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
  P? read(String id, int depth) {
    throw UnimplementedError();
  }

  @override
  void write(Quant value, int depth) {
    super.write(value, depth);

    _writePlan(value as Plan<dynamic>, depth);
  }

  void _writePlan(Plan<dynamic> plan, int depth, [String? pathPrefix]) {
    _writePlanXml(plan, pathPrefix);
    _writePlanPictureComponent(plan, pathPrefix);

    final prefix = ph.join(pathPrefix ?? '', plan.hid);

    // convert the imageries to plans and save them
    for (final imagery in plan.imageries) {
      if (depth > 0) {
        _writePlan(imagery as Plan<dynamic>, depth - 1, prefix);
      }
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
    for (final imagery in plan.imageries) {
      ++id;
      tilesets.add(VImagery.fromImagery(
        planId: plan.id,
        imagery: imagery as Plan<dynamic>,
        tileWidth: 123,
        tileHeight: 123,
        firstGid: id,
      ));

      ++id;
      tileObjects.add(VObjectTile.fromImagery(
        id: id,
        gid: id - 1,
        imagery: imagery,
        x: 0,
        y: 0,
        width: 60,
        height: 60,
      ));
    }

    // compact the objects to layers
    final layers = <Layer>[];
    final picture = plan.innerEntity.get<PictureComponent>();
    {
      if (picture != null) {
        ++id;
        layers.add(VPictureLayer(
          id: id,
          name: picture.hid,
          width: picture.width,
          height: picture.height,
        ));
      }

      if (story != null && storyObjects.isNotEmpty) {
        ++id;
        layers.add(VConcreteComponent(
          id: id,
          name: story.hid,
          objects: storyObjects,
        ));
      }

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
}
