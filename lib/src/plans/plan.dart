// ignore_for_file: inference_failure_on_function_invocation

part of '../../vast_world.dart';

/// [render] Constructing a representation the [I] to this plan.
/// ! Call [removeInnerEntity()] if working with a set of plans and removing the plan.
class Plan<I extends Plan<dynamic>> extends Quant {
  Plan(
    this.u, {
    super.hid,
    super.uid,
    List<I>? impactsOnPlans,
  }) {
    // to fix error `UnmodifiableList`
    this.impactsOnPlans = impactsOnPlans ?? List<I>.empty(growable: true);

    // an one entity on each plan
    innerEntity = u.construct(id);
    set<IdComponent, IdT>(IdComponent.new, (hid: hid, uid: uid));
  }

  /// Auto-detect to set [uid] or [hid].
  @override
  set id(String uidOrHid) {
    super.id = uidOrHid;
    component<IdComponent>()!.value = (hid: super.hid, uid: super.uid);
  }

  /// Alias [get].
  T? component<T extends VComponent<dynamic>>() => innerEntity.get<T>();

  /// Alias [component].
  T? get<T extends VComponent<dynamic>>() => component<T>();

  /// Set a component value and register the component when it absent.
  /// See [addComponent], [VComponent], [component].
  void set<T extends VComponent<V>, V>(ComponentBuilder<T> builder, [V? data]) {
    u.registerComponent(builder);

    final c = component<T>();
    if (c == null) {
      innerEntity.add<T, V>(data);
    } else {
      c.value = data;
    }
  }

  /// Remove this plan from Universe.
  void removeInnerEntity() => u.removeEntity(innerEntity);

  Plan copyWith({
    Universe? u,
    String? hid,
    String? uid,
    List<I>? impactsOnPlans,
  }) =>
      Plan(
        u ?? this.u,
        hid: hid ?? this.hid,
        uid: uid ?? this.uid,
        impactsOnPlans: impactsOnPlans ?? this.impactsOnPlans,
      );

  final Universe u;

  @protected
  late Entity innerEntity;

  late final List<I> impactsOnPlans;

  /// Alias [impactsOnPlans].
  List<I> get exposed => impactsOnPlans;

  void addToImpacts(I plan) => impactsOnPlans.add(plan);
}
