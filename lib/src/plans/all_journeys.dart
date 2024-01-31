part of '../../vast_world.dart';

/// Contains all journeys.
Plan<dynamic> constructAllJourneysPlan(
  Universe u, {
  String? hid,
  String? uid,
}) =>
    constructNothingPlan(u, hid: hid, uid: uid)
      ..set(TiledmapRenderComponent.new, allJourneysTiledmapRender);
