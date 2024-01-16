// ignore_for_file: inference_failure_on_function_invocation

part of '../../vast_world.dart';

class Plan<P extends Quant> extends Quant {
  Plan(
    this.u, {
    String hid = '',
    String uid = '',
  }) {
    u.registerComponent(IdComponent.new);

    // an one entity on every plan
    innerEntity = u.construct()..add<IdComponent, IdT>((hid: hid, uid: uid));
  }

  final Universe u;

  late final Entity innerEntity;

  IdComponent get idComponent => innerEntity.get<IdComponent>()!;

  @override
  String get hid => idComponent.hid;

  @override
  String get uid => idComponent.uid;

  final List<P> imageries = <P>[];

  void addImagery(P imagery) => imageries.add(imagery);
}
