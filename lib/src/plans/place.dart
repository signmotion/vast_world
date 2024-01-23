// ignore_for_file: inference_failure_on_function_invocation

part of '../../vast_world.dart';

Plan<dynamic> constructPlacePlan(
  Universe u, {
  String? hid,
  String? uid,
  required Image picture,
  required StoryT story,
}) {
  final p = constructNothingPlan(u, hid: hid, uid: uid);

  u.registerComponent(PictureComponent.new);
  u.registerComponent(StoryComponent.new);
  u.registerComponent(TiledmapRenderComponent.new);

  p.innerEntity
    ..add<PictureComponent, Image>(picture)
    ..add<StoryComponent, StoryT>(story)
    ..add<TiledmapRenderComponent, RenderFn<TiledmapT>>(placeTiledmapRender);

  return p;
}
