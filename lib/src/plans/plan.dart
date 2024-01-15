// ignore_for_file: inference_failure_on_function_invocation

part of '../../vast_world.dart';

class Plan extends Universe {
  Plan() {
    component(IdComponent.new);
  }

  factory Plan.construct({
    String hid = '',
    String uid = '',
  }) {
    final r = Plan();
    r.construct(hid).add<IdComponent, IdT>((hid: hid, uid: uid));

    return r;
  }
}
