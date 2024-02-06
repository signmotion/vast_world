import 'package:vast_world/vast_world_share.dart';

import 'place.dart';

/// Example:
///   A journey by country.
/// See [constructPlacePlan].
Plan<dynamic> constructJourneyPlan(
  Universe u, {
  String? hid,
  String? uid,
  required String name,
  required String greeting,
  required String description,
}) =>
    constructNothingPlan(
      u,
      hid: hid,
      uid: uid,
      componentBuilder: NativeComponentBuilder.new,
    )
      ..set(NameComponent.new, name)
      ..set(GreetingComponent.new, greeting)
      ..set(DescriptionComponent.new, description)
      ..set(TiledmapRenderComponent.new, journeyTiledmapRender);
