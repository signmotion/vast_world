// ignore_for_file: inference_failure_on_function_invocation

part of '../../vast_world.dart';

class PlacePlan extends Plan {
  PlacePlan() {
    component(PictureComponent.new);
    component(StoryComponent.new);
  }

  factory PlacePlan.construct({
    String hid = '',
    String uid = '',
    required Image picture,
    required String story,
  }) {
    final plan = PlacePlan();
    plan.construct(hid)
      ..add<IdComponent, IdT>((hid: hid, uid: uid))
      ..add<PictureComponent, Image>(picture)
      ..add<StoryComponent, String>(story);

    return plan;
  }
}
