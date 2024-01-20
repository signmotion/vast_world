part of '../../vast_world.dart';

abstract class TiledmapKeeper<
    Q extends Quant,
    ImgB extends Broker<dynamic>,
    TxtB extends Broker<dynamic>,
    XmlB extends Broker<dynamic>> extends Keeper<Q, ImgB, TxtB, XmlB> {
  TiledmapKeeper({
    required super.imageBroker,
    required super.textBroker,
    required super.xmlBroker,
    super.readOnly = true,
  });
}

/// For define typed [Keeper] we can use inheritance or this syntax:
/// ```
/// typedef Keeper = PlanTiledmapKeeper<ImageFilesystemBroker, TextFilesystemBroker>;
/// ```
class PlanTiledmapKeeper<
    P extends Plan<dynamic>,
    ImgB extends Broker<dynamic>,
    TxtB extends Broker<dynamic>,
    XmlB extends Broker<dynamic>> extends TiledmapKeeper<P, ImgB, TxtB, XmlB> {
  PlanTiledmapKeeper({
    required super.imageBroker,
    required super.textBroker,
    required super.xmlBroker,
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
    if (plan is PlacePlan || plan is JourneyPlan) {
      final renderComponent = plan.get<TiledmapRenderComponent>();
      ae(
          renderComponent != null,
          'The plan `${plan.id}` should contains `TiledmapRenderComponent`'
          ' for transform the plan to Tiledmap format.');

      final r = renderComponent!.render(AbsolutePlan(), plan);
      final pp = pathPrefix ?? '';

      xmlBroker.write(
        ph.join(pp, r.fileXml.pathToFile),
        r.fileXml.content,
      );

      for (final fm in r.fileImages) {
        imageBroker.write(
          ph.join(pp, fm.pathToFile),
          fm.content,
        );
      }
    }

    // TODO
    // _writePlanXml(plan, pathPrefix);
    // _writePlanPictureComponent(plan, pathPrefix);

    // // ! keep all plans to the root; reason: 1 plan can links to some exposed,
    // // ! change them & take changes them
    // final prefix = pathPrefix;

    // // save the exposed as plans
    // for (final exposed in plan.impactsOnPlans) {
    //   _writePlan(exposed as Plan<dynamic>, depth - 1, prefix);
    // }
  }

  void _writePlanXml(Plan<dynamic> plan, [String? pathPrefix]) {
    var id = 0;

    // story
    final storyObjects = <VObjectText>[];
    final story = plan.get<StoryComponent>();
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

    final imageRenderComponent =
        plan.get<DEPRECATED_ImageRenderForExposedComponent>();
    ae(
      imageRenderComponent != null || plan is NothingPlan,
      'Render should be defined for plan `${plan.id}`'
      ' or should be inheritance NothingPlan.',
    );

    // tilesets
    final tileObjects = <VObjectTile>[];
    final tilesets = <VTileset>[];
    if (imageRenderComponent != null) {
      var lastY = 0.0;
      for (var i = plan.impactsOnPlans.length - 1; i >= 0; --i) {
        final exposed = plan.impactsOnPlans[i] as Plan<dynamic>;

        final rendered = imageRenderComponent.renderData(plan, exposed);
        //final rendered = CountExposedImageRender(plan, exposed).rendered;
        //final rendered = OnePictureImageRender(plan, exposed).rendered;
        _writeImageRendered(rendered);

        final image = rendered.data!;

        ++id;
        // all exposed of plan keeps into the folder `rendered`
        final pictureImage = VPictureImage(
          name: 'rendered/image/${exposed.hid}/data',
          width: image.width,
          height: image.height,
        );
        tilesets.add(VTileset(
          name: exposed.hid,
          tileWidth: image.width,
          tileHeight: image.height,
          image: pictureImage,
          tileCount: 1,
          firstGid: id,
        ));

        ++id;
        // align by vertical center
        const wantIndentY = 40;
        final x = image.width / 2;
        lastY += image.height + wantIndentY;
        tileObjects.add(VObjectTile(
          id: id,
          gid: id - 1,
          name: exposed.id,
          x: x.round(),
          y: lastY.round(),
          width: image.width,
          height: image.height,
        ));
      }
    }

    // compact the objects to layers
    final layers = <Layer>[];
    final picture = plan.get<PictureComponent>();
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

      // rendered exposed as tiles
      if (imageRenderComponent != null && tileObjects.isNotEmpty) {
        ++id;
        layers.add(VExposedList(
          id: id,
          objects: tileObjects,
        ));
      }
    }

    final w = picture?.width ?? 0;
    final h = picture?.height ?? 0;
    final map = VMap(
      width: w,
      height: h,
      infinite: w == 0 || h == 0,
      tilesets: tilesets,
      layers: layers,
    );
    final s = const VConverter(pretty: false).convert(map);
    final pf = ph.join(pathPrefix ?? '', plan.id, VMap.defaultContentFilename);
    textBroker.write(pf, s);
  }

  void _writePlanPictureComponent(Plan<dynamic> plan, [String? pathPrefix]) {
    final picture = plan.get<PictureComponent>();
    if (picture != null) {
      final pf = ph.join(pathPrefix ?? '', plan.id, '${picture.hid}.png');
      imageBroker.write(pf, picture.image);
    }
  }

  void _writeImageRendered(RenderedData<Image> rendered) {
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
