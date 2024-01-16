// ignore_for_file: inference_failure_on_function_invocation

part of '../../vast_world.dart';

class Plan extends Universe {
  Plan() {
    registerComponent(IdComponent.new);
  }

  factory Plan.construct({
    String hid = '',
    String uid = '',
  }) {
    final r = Plan();
    r.construct(hid).add<IdComponent, IdT>((hid: hid, uid: uid));

    return r;
  }

  void check() {
    ae(u.entities.length == 1, 'The plan `$id` should consist of 1 entity.');
  }

  IdComponent get idComponent => u.entities.single.get<IdComponent>()!;

  String get id => idComponent.id;
  String get hid => idComponent.hid;
  String get uid => idComponent.uid;
}
