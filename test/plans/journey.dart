import 'package:vast_world/vast_world_share.dart';

import 'place.dart';

/// Example:
///   A journey by country.
/// See [constructPlacePlan].
Plan constructJourneyPlan(
  Lore lore, {
  String? hid,
  String? uid,
  required String name,
  required String greeting,
  required String description,
}) =>
    constructNothingPlanIntoLore(
      lore,
      hid: hid,
      uid: uid,
    )
      ..set(NameComponent.new, name)
      ..set(GreetingComponent.new, greeting)
      ..set(DescriptionComponent.new, description)
      ..set(TiledmapRenderComponent.new, journeyTiledmapRender);
