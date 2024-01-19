// ignore_for_file: inference_failure_on_function_invocation

part of '../../vast_world.dart';

/// [render] Constructing a representation the [I] to this plan.
class Plan<I extends Plan<dynamic>> extends Quant {
  Plan(
    this.u, {
    super.hid = '',
    super.uid = '',
    required RenderBuilder? renderBuilderForExposed,
    this.impactsOnPlans = const [],
  }) {
    u.registerComponent(IdComponent.new);
    u.registerComponent(RenderComponent.new);

    // an one entity on each plan
    innerEntity = u.construct(id)
      ..add<IdComponent, IdT>((hid: hid, uid: uid))
      ..add<RenderComponent, RenderBuilder?>(renderBuilderForExposed);
  }

  final Universe u;

  @protected
  late final Entity innerEntity;

  final List<I> impactsOnPlans;

  void addToImpacts(I plan) => impactsOnPlans.add(plan);

  T? get<T extends VComponent<dynamic>>() => innerEntity.get<T>();
}
