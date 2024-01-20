// ignore_for_file: inference_failure_on_function_invocation

part of '../../vast_world.dart';

/// The plan for spectate any [PlacePlan] as TMX formatted plan.
/// Attempt to rendering into TMX with [Plan] features.
class DEPRECATED_TmxTiledmapPlacePlan extends Plan<PlacePlan> {
  DEPRECATED_TmxTiledmapPlacePlan(
    super.u, {
    super.hid = '',
    required PlacePlan placePlan,
  }) : super(
          imageRenderForExposed: _imageRenderForPlacePlan,
          xmlRenderForExposed: _xmlRenderForPlacePlan,
        ) {
    addToImpacts(placePlan);
  }

  static Image _imageRenderForPlacePlan(
    Plan<dynamic> spectator,
    Plan<dynamic> watched,
  ) {
    // ae(spectator == watched,
    // "PlacePlan doesn't contain exposed therefore should be same.");

    const configure = ImageRenderConfigure();

    final picture = watched.get<PictureComponent>();

    return picture?.image ?? defaultImage(configure);
  }

  static XmlDocument _xmlRenderForPlacePlan(
    Plan<dynamic> spectator,
    Plan<dynamic> watched,
  ) {
    const configure = TiledmapRenderConfigure();

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
}
