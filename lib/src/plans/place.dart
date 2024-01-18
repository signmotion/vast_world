// ignore_for_file: inference_failure_on_function_invocation

part of '../../vast_world.dart';

class PlacePlan extends Plan<Quant> {
  PlacePlan(
    super.u,
    super.parentId, {
    super.hid = '',
    super.uid = '',
    required Image picture,
    required StoryT story,
  }) {
    u.registerComponent(PictureComponent.new);
    u.registerComponent(StoryComponent.new);

    innerEntity
      ..add<PictureComponent, Image>(picture)
      ..add<StoryComponent, StoryT>(story);
  }
}
