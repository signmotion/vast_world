// ignore_for_file: inference_failure_on_function_invocation

part of '../../vast_world.dart';

typedef PlacePlanListComponent = PlanListComponent<PlacePlan>;

/// Example:
///   A journey by country.
class JourneyPlan extends Plan {
  JourneyPlan() {
    registerComponent(NameComponent.new);
    registerComponent(GreetingComponent.new);
    registerComponent(DescriptionComponent.new);
    registerComponent(PlacePlanListComponent.new);
  }

  factory JourneyPlan.construct({
    String hid = '',
    String uid = '',
    required String name,
    required String greeting,
    required String description,
  }) {
    final plan = JourneyPlan();
    plan.construct(hid)
      ..add<IdComponent, IdT>((hid: hid, uid: uid))
      ..add<NameComponent, String>(name)
      ..add<GreetingComponent, String>(name)
      ..add<DescriptionComponent, String>(name)
      ..add<PlacePlanListComponent, List<PlacePlan>>();

    return plan;
  }
}
