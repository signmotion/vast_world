// ignore_for_file: inference_failure_on_function_invocation

part of '../../vast_world.dart';

class JourneysPlan extends Plan {
  JourneysPlan() {
    component(ListComponent<JourneyComponent>.new);
  }

  factory JourneysPlan.construct({
    String hid = '',
    String uid = '',
  }) {
    final r = JourneysPlan();
    r.construct(hid)
      ..add<IdComponent, IdT>((hid: hid, uid: uid))
      ..add<ListComponent<JourneyComponent>, List<JourneyComponent>>();

    return r;
  }

  void addJourney(JourneyPlan journey) {
    throw UnimplementedError();
  }
}
