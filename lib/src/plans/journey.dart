part of '../../vast_world.dart';

/// Example:
///   A journey by country.
Plan<dynamic> constructJourneyPlan(
  Universe u, {
  String? hid,
  String? uid,
  required String name,
  required String greeting,
  required String description,
}) =>
    constructNothingPlan(u, hid: hid, uid: uid)
      ..set(NameComponent.new, name)
      ..set(GreetingComponent.new, greeting)
      ..set(DescriptionComponent.new, description)
      ..set(TiledmapRenderComponent.new, journeyTiledmapRender);
