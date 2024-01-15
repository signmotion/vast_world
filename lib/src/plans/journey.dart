// ignore_for_file: inference_failure_on_function_invocation

part of '../../vast_world.dart';

/// Example:
///   A journey by country.
class JourneyPlan extends Plan {
  JourneyPlan() {
    component(NameComponent.new);
    component(GreetingComponent.new);
    component(DescriptionComponent.new);
    component(ListComponent<PlaceComponent>.new);
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
      ..add<ListComponent<PlaceComponent>, List<PlaceComponent>>();

    return plan;
  }

  void addPlace(PlacePlan place) {
    throw UnimplementedError();
  }
}
