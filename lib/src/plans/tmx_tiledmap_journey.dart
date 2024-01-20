// ignore_for_file: inference_failure_on_function_invocation

part of '../../vast_world.dart';

/// The plan for spectate any [JourneyPlan] as TMX formatted plan.
/// Attempt to rendering into TMX with [Plan] features.
class TmxTiledmapJourneyPlan extends Plan<JourneyPlan> {
  TmxTiledmapJourneyPlan(
    super.u, {
    super.hid = '',
    required JourneyPlan journeyPlan,
  }) : super(
          imageRenderForExposed: _imageRenderForJourneyPlan,
          xmlRenderForExposed: _xmlRenderForJourneyPlan,
          imageRenderForChildExposed: _imageRenderForPlacePlan,
        ) {
    addToImpacts(journeyPlan);
  }

  static Image _imageRenderForJourneyPlan(
    Plan<dynamic> spectator,
    Plan<dynamic> watched,
  ) {
    // ae(spectator == watched,
    // "PlacePlan doesn't contain exposed therefore should be same.");

    const configure = ImageRenderConfigure();

    return defaultImage(configure);
  }

  static XmlDocument _xmlRenderForJourneyPlan(
    Plan<dynamic> spectator,
    Plan<dynamic> watched,
  ) {
    const configure = TiledmapRenderConfigure();

    final id = TransitIdGen();

    // tilesets
    final tileObjects = <VObjectTile>[];
    final tilesets = <VTileset>[];
    final imageRenderForChildExposedComponent =
        spectator.get<ImageRenderForChildExposedComponent>()!;
    var lastY = 0.0;
    for (var i = watched.impactsOnPlans.length - 1; i >= 0; --i) {
      final exposed = watched.impactsOnPlans[i] as Plan<dynamic>;

      // TODO(sign): optimize Rendered twice.
      final render =
          imageRenderForChildExposedComponent.render(watched, exposed);
      final image = render;

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
        firstGid: id.next,
      ));

      // align by vertical center
      final x = image.width / 2;
      lastY += image.height + configure.indent;
      tileObjects.add(VObjectTile(
        id: id.next,
        gid: id.current - 1,
        name: exposed.id,
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

  static Image _imageRenderForPlacePlan(
    Plan<dynamic> spectator,
    Plan<dynamic> watched,
  ) =>
      onePictureImageRender(spectator, watched);
}
