// ignore_for_file: inference_failure_on_function_invocation

part of '../../vast_world.dart';

/// Example:
///   A journey by country.
class JourneyPlan extends Plan<PlacePlan> {
  JourneyPlan(
    super.u, {
    super.hid = '',
    super.uid = '',
    required String name,
    required String greeting,
    required String description,
  }) : super(imageRenderForExposed: onePictureImageRender) {
    u.registerComponent(NameComponent.new);
    u.registerComponent(GreetingComponent.new);
    u.registerComponent(DescriptionComponent.new);
    u.registerComponent(TiledmapRenderComponent.new);

    innerEntity
      ..add<NameComponent, String>(name)
      ..add<GreetingComponent, String>(name)
      ..add<DescriptionComponent, String>(name)
      ..add<TiledmapRenderComponent, RenderFn<TiledmapT>>(
          journeyTiledmapRender);
    ;
  }
}
