// ignore_for_file: inference_failure_on_function_invocation

part of '../../vast_world.dart';

/// Contains all journeys.
Plan<dynamic> constructAllJourneysPlan(
  Universe u, {
  String? hid,
  String? uid,
}) {
  final p = constructNothingPlan(u, hid: hid, uid: uid);

  u.registerComponent(TiledmapRenderComponent.new);

  p.innerEntity.add<TiledmapRenderComponent, RenderFn<TiledmapT>>(
      allJourneysTiledmapRender);

  return p;
}
