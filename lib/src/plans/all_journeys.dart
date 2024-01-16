// ignore_for_file: inference_failure_on_function_invocation

part of '../../vast_world.dart';

typedef JourneyPlanListComponent = PlanListComponent<JourneyPlan>;

class AllJourneysPlan extends Plan {
  AllJourneysPlan() {
    registerComponent(JourneyPlanListComponent.new);
  }

  factory AllJourneysPlan.construct({
    String hid = '',
    String uid = '',
  }) {
    final r = AllJourneysPlan();
    r.construct(hid)
      ..add<IdComponent, IdT>((hid: hid, uid: uid))
      ..add<JourneyPlanListComponent, List<JourneyPlan>>();

    return r;
  }
}
