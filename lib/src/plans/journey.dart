// ignore_for_file: inference_failure_on_function_invocation

part of '../../vast_world.dart';

/// Example:
///   A journey by country.
Plan<dynamic> constructJourneyPlan(
  Universe u, {
  String? hid,
  String? uid,
  required String name,
  required String greeting,
  required String description,
}) {
  final p = constructNothingPlan(u, hid: hid, uid: uid);

  u.registerComponent(NameComponent.new);
  u.registerComponent(GreetingComponent.new);
  u.registerComponent(DescriptionComponent.new);
  u.registerComponent(TiledmapRenderComponent.new);

  p.innerEntity
    ..add<NameComponent, String>(name)
    ..add<GreetingComponent, String>(name)
    ..add<DescriptionComponent, String>(name)
    ..add<TiledmapRenderComponent, RenderFn<TiledmapT>>(journeyTiledmapRender);

  return p;
}
