part of '../../vast_world.dart';

Plan<dynamic> constructPlacePlan(
  Universe u, {
  String? hid,
  String? uid,
  required Image picture,
  required StoryT story,
}) =>
    constructNothingPlan(u, hid: hid, uid: uid)
      ..set(PictureComponent.new, picture)
      ..set(StoryComponent.new, story)
      ..set(TiledmapRenderComponent.new, placeTiledmapRender);
