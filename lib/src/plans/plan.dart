// ignore_for_file: inference_failure_on_function_invocation

part of '../../vast_world.dart';

/// [render] Constructing a representation the [I] to this plan.
/// ! Call [removeInnerEntity()] if working with a set of plans and removing the plan.
class Plan<I extends Plan<dynamic>> extends Quant {
// TODO class Plan<I extends Plan<dynamic>, L extends LayoutComponent> extends Quant {
  Plan(
    this.u,
    this.base, {
    String? hid,
    String? uid,
    //L? layoutForExposed,
  }) {
    base.hid = hid ?? base.hid;
    base.uid = uid ?? (base.uid.isEmpty ? genUuid : base.uid);

    // to fix error `UnmodifiableList`
    this.impactsOnPlans = List<I>.empty(growable: true);

    // an one entity on each plan
    final debugId = base.hid.isEmpty ? base.uid : base.hid;
    innerEntity = u.construct(debugId);

    set<IdComponent, IdT>(IdComponent.new, (hid: base.hid, uid: base.uid));
    // TODO set<LayoutComponent>(layoutForExposed.builder);
  }

  factory Plan.construst(
    Universe u, {
    String? hid,
    String? uid,
  }) =>
      Plan(
        u,
        PlanBase(components: {}, exposed: {}),
        hid: hid,
        uid: uid,
      );

  final Universe u;

  final PlanBase base;

  /// TODO(sign): Return [uid] always when production.
  @override
  String get id => super.id;

  /// Auto-detect to set [uid] or [hid].
  @override
  set id(String uidOrHid) {
    super.id = uidOrHid;
    set(IdComponent.new, (hid: super.hid, uid: super.uid));
  }

  /// Alias [get].
  T? component<T extends Component<dynamic>>() => innerEntity.get<T>();

  /// Alias [component].
  T? get<T extends Component<dynamic>>() => component<T>();

  /// Set a component value and register the component when it absent.
  /// See [addComponent], [Component], [component].
  void set<T extends Component<V>, V>(
    oxygen.ComponentBuilder<T> builder, [
    V? data,
  ]) {
    _setIntoBase(builder, data);
    _setIntoRoot(builder, data);
  }

  void _setIntoBase<T extends Component<V>, V>(
    oxygen.ComponentBuilder<T> builder, [
    V? data,
  ]) {
    final c = builder()..init(data);
    base.components[c.id] = c.base;
  }

  void _setIntoRoot<T extends Component<V>, V>(
    oxygen.ComponentBuilder<T> builder, [
    V? data,
  ]) {
    u.registerComponent(builder);

    final c = component<T>();
    if (c == null) {
      innerEntity.add<T, V>(data);
    } else {
      c.init(data);
    }
  }

  /// Remove this plan from Universe.
  void removeInnerEntity() => u.removeEntity(innerEntity);

  Plan copyWith({
    Universe? u,
    PlanBase? base,
    String? hid,
    String? uid,
    // TODO LayoutComponent? layoutForExposed,
  }) =>
      Plan(
        u ?? this.u,
        base ?? this.base,
        hid: hid ?? this.hid,
        uid: uid ?? this.uid,
        // TODO layoutForExposed: layoutForExposed ?? this.layoutForExposed,
      );

  @protected
  late oxygen.Entity innerEntity;

  late final List<I> impactsOnPlans;

  /// Alias [impactsOnPlans].
  List<I> get exposed => impactsOnPlans;

  /// Layout for [exposed] plans.
  /// See [setLayout].
  // TODO late final LayoutComponent? layoutForExposedBuilder;

  /// See [layoutForExposed].
  // @protected
  // void setLayout<L>(LayoutComponent layoutFromParent, L? location) {
  //   layoutForExposed = layoutFromParent;
  //   layoutForExposed.init(location);
  // }

  /// Every added [plan] will be enhanced with a component from [layout].
  /// This is necessary for compound [exposed] plans.
  void addToImpacts(I plan) {
    // TODO void addToImpacts<L extends LocationValue>(I plan, [L? location]) {
    // TODO plan.setLayout(layoutForExposed, location);

    _addToImpactsIntoBase(plan);
    _addToImpactsIntoRoot(plan);
  }

  void _addToImpactsIntoBase(I plan) => base.exposed[plan.id] = plan.base;

  void _addToImpactsIntoRoot(I plan) => impactsOnPlans.add(plan);
}
