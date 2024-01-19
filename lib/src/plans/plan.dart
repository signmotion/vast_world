// ignore_for_file: inference_failure_on_function_invocation

part of '../../vast_world.dart';

/// [render] Constructing a representation the [I] to this plan.
class Plan<I extends Plan<dynamic>> extends Quant {
  Plan(
    this.u, {
    super.hid = '',
    super.uid = '',
    RenderFn<Image>? imageRenderForExposed,
    List<I>? impactsOnPlans,
  }) {
    // to fix error `UnmodifiableList`
    this.impactsOnPlans = impactsOnPlans ?? List<I>.empty(growable: true);

    u.registerComponent(IdComponent.new);
    u.registerComponent(ImageRenderComponent.new);

    // an one entity on each plan
    innerEntity = u.construct(id)
      ..add<IdComponent, IdT>((hid: hid, uid: uid))
      ..add<ImageRenderComponent, RenderFn<Image>?>(imageRenderForExposed);
  }

  final Universe u;

  @protected
  late final Entity innerEntity;

  late final List<I> impactsOnPlans;

  void addToImpacts(I plan) => impactsOnPlans.add(plan);

  T? get<T extends VComponent<dynamic>>() => innerEntity.get<T>();
}
