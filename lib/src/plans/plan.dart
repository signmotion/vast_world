// ignore_for_file: inference_failure_on_function_invocation

part of '../../vast_world.dart';

class Plan<P extends Quant> extends Quant {
  Plan(
    this.u,
    String parentId, {
    super.hid = '',
    super.uid = '',
  }) {
    u.registerComponent(IdComponent.new);
    u.registerComponent(ParentComponent.new);

    // an one entity on every plan
    innerEntity = u.construct(id)..add<IdComponent, IdT>((hid: hid, uid: uid));
    if (parentId.isNotEmpty) {
      innerEntity.add<ParentComponent, ParentT>((id: parentId));
    }
  }

  final Universe u;

  String get parentId => innerEntity.get<ParentComponent>()!.id;

  late final Entity innerEntity;

  final List<P> imageries = <P>[];

  void addImagery(P imagery) => imageries.add(imagery);
}
