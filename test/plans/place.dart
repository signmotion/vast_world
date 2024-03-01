import 'package:image/image.dart';
import 'package:vast_world/vast_world_share.dart';

import 'journey.dart';

/// A place of journey.
/// See [constructJourneyPlan].
Plan<Plan<dynamic>> constructPlacePlan(
  Lore lore, {
  String? hid,
  String? uid,
  required Image picture,
  required StoryT story,
}) =>
    constructNothingPlanIntoLore(
      lore,
      hid: hid,
      uid: uid,
    )
      ..set(PictureComponent.new, picture)
      ..set(StoryComponent.new, story)
      ..set(TiledmapRenderComponent.new, placeTiledmapRender);
