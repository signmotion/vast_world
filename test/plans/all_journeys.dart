import 'package:vast_world/vast_world_share.dart';

import 'journey.dart';

/// Contains all journeys.
/// See [constructJourneyPlan].
Plan<Plan<dynamic>> constructAllJourneysPlan(
  Lore lore, {
  String? hid,
  String? uid,
}) =>
    constructNothingPlanIntoLore(
      lore,
      hid: hid,
      uid: uid,
    )..set(TiledmapRenderComponent.new, allJourneysTiledmapRender);
