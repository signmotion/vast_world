import 'package:vast_world/vast_world_share.dart';

import 'journey.dart';

/// Contains all journeys.
/// See [constructJourneyPlan].
Plan<dynamic> constructAllJourneysPlan(
  Universe u, {
  String? hid,
  String? uid,
}) =>
    constructNothingPlan(u, hid: hid, uid: uid)
      ..set(TiledmapRenderComponent.new, allJourneysTiledmapRender);
