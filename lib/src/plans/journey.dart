// ignore_for_file: inference_failure_on_function_invocation

part of '../../vast_world.dart';

/// Example:
///   A journey by country.
class JourneyPlan extends Plan<PlacePlan> {
  JourneyPlan(
    super.u,
    super.parentId, {
    super.hid = '',
    super.uid = '',
    required String name,
    required String greeting,
    required String description,
  }) {
    u.registerComponent(NameComponent.new);
    u.registerComponent(GreetingComponent.new);
    u.registerComponent(DescriptionComponent.new);

    innerEntity
      ..add<NameComponent, String>(name)
      ..add<GreetingComponent, String>(name)
      ..add<DescriptionComponent, String>(name);
  }
}
