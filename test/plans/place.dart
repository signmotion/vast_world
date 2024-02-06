import 'package:image/image.dart';
import 'package:vast_world/vast_world_share.dart';

import 'journey.dart';

/// A place of journey.
/// See [constructJourneyPlan].
Plan<dynamic> constructPlacePlan(
  Universe u, {
  String? hid,
  String? uid,
  required Image picture,
  required StoryT story,
}) =>
    constructNothingPlan(
      u,
      hid: hid,
      uid: uid,
      componentBuilder: NativeComponentBuilder.new,
    )
      ..set(PictureComponent.new, picture)
      ..set(StoryComponent.new, story)
      ..set(TiledmapRenderComponent.new, placeTiledmapRender);
