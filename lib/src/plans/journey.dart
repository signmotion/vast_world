// ignore_for_file: inference_failure_on_function_invocation

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
      ..set<NameComponent, String>(NameComponent.new, name)
      ..set<GreetingComponent, String>(GreetingComponent.new, greeting)
      ..set<DescriptionComponent, String>(DescriptionComponent.new, description)
      ..set<TiledmapRenderComponent, RenderFn<TiledmapT>>(
        TiledmapRenderComponent.new,
        journeyTiledmapRender,
      );
