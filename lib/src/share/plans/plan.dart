// ignore_for_file: inference_failure_on_function_invocation

part of '../../../vast_world_share.dart';

/// [render] Constructing a representation the [I] to this plan.
/// ! Call [removeInnerEntity()] if working with a set of plans and removing the plan.
class Plan<I extends Plan<Plan<dynamic>>> extends Quant {
// TODO class Plan<I extends Plan<dynamic>, L extends LayoutComponent> extends Quant {
  Plan(
    this.u, {
    String? id,
    String? hid,
    String? uid,
    //L? layoutForExposed,
  }) : assert((id != null && hid == null && uid == null) || id == null,
            '[id] should be defined without [hid] and [uid].') {
    // an one entity on each plan
    final debugId = id;
    innerEntity = this.u.construct(debugId);

    // to fix error `UnmodifiableList`
    this.exposed = List<I>.empty(growable: true);

    if (id == null) {
      this.hid = hid ?? '';
      this.uid = uid ?? genPlanUid;
    } else {
      this.id = id;
    }

    set<IdComponent, IdT>(IdComponent.new, (hid: this.hid, uid: this.uid));

    // TODO set<LayoutComponent>(layoutForExposed.builder);
  }

  final Universe u;

  /// This plan converted to [PlanBase].
  /// See [jsonAsBase] to backward conversion.
  @override
  PlanBase get base => PlanBase(
        hid: hid,
        uid: uid,
        components: {for (final c in components) c.id: c.base},
        exposed: {for (final p in exposed) p.id: p.base},
      );

  List<AnyComponent> get components =>
      const ComponentBuilder().components(u, innerEntity);

  List<TBuilder<AnyComponent>> get componentsBuilders =>
      const ComponentBuilder().componentsBuilders(u, innerEntity);

  @override
  bool get isCorrectHid => hid.isPlanHid;

  /// TODO(sign): Return [uid] always when production.
  @override
  String get id => super.id;

  /// Auto-detect to set [uid] or [hid].
  @override
  set id(String uidOrHid) {
    if (uidOrHid.isPlanUid) {
      hid = '';
      uid = uidOrHid;
    } else {
      hid = uidOrHid;
      uid = genPlanUid;
    }
    argerr(hid.isEmpty || isCorrectHid, hid, 'hid');
    argerr(isCorrectUid, uid, 'uid');
    set(IdComponent.new, (hid: hid, uid: uid));
  }

  @override
  bool get isCorrectUid => uid.isPlanUid;

  /// Returns the [Component].
  /// See [get], [getValue].
  C? component<C extends AnyComponent>() => ie.get<C>();

  /// Alias [component].
  C? get<C extends AnyComponent>() => component<C>();

  /// Returns a value of the [Component].
  dynamic getValue<C extends AnyComponent>() => get<C>()?.value;

  /// Set the component [data] and register the component when it absent.
  /// See [setComponent], [addComponent], [Component], [component].
  void set<C extends Component<V>, V>(
    oxygen.ComponentBuilder<C> builder, [
    V? data,
  ]) {
    u.registerComponent(builder);

    final c = component<C>();
    if (c == null) {
      ie.add<C, V>(data);
    } else {
      c.init(data);
    }
  }

  /// Set a [component] with value and register [component] the component when
  /// [component] absent.
  /// See [set].
  void setComponent(AnyComponent component) {
    var found = components.firstWhereOrNull((c) => c.uid == component.uid);
    if (found == null) {
      const ComponentBuilder().add(component.uid, u, ie, component.valueAsJson);
      found = components.firstWhereOrNull((c) => c.uid == component.uid)!;
    }
    found.init(component.value);
  }

  /// Remove this plan from Universe.
  void removeInnerEntity() => u.removeEntity(ie);

  Plan copyWith({
    Universe? u,
    String? hid,
    String? uid,
    // TODO LayoutComponent? layoutForExposed,
  }) =>
      Plan(
        u ?? this.u,
        hid: hid ?? this.hid,
        uid: uid ?? this.uid,
        // TODO layoutForExposed: layoutForExposed ?? this.layoutForExposed,
      );

  @protected
  late final oxygen.Entity innerEntity;

  /// Alias [innerEntity].
  oxygen.Entity get ie => innerEntity;

  /// The plans that this plan can view and change.
  /// This plan can be changing any [exposed] into it plans.
  /// But not each plan should change [exposed] plans.
  /// For example, a projection of some place as hologram, on display or
  /// just drawing.
  /// TODO Declare permissions?
  late final List<I> exposed;

  /// Layout for [exposed] plans.
  /// See [setLayout].
  // TODO late final LayoutComponent? layoutForExposedBuilder;

  /// See [layoutForExposed].
  // @protected
  // void setLayout<L>(LayoutComponent layoutFromParent, L? location) {
  //   layoutForExposed = layoutFromParent;
  //   layoutForExposed.init(location);
  // }

  /// Alias [addToExposed].
  void bind(I plan) => addToExposed(plan);

  /// Every added [plan] will be enhanced with a component from [layout].
  /// This is necessary for compound [exposed] plans.
  /// See [bind].
  void addToExposed(I plan) {
    // TODO void addToImpacts<L extends LocationValue>(I plan, [L? location]) {
    // TODO plan.setLayout(layoutForExposed, location);

    exposed.add(plan);
  }

  /// See [base].
  /// See [jsonAsPlanBase].
  @override
  PlanBase jsonAsBase(JsonMap json) => jsonAsPlanBase(json);
}

PlanBase jsonAsPlanBase(JsonMap json) => switch (json) {
      {
        'hid': String? hid,
        'uid': String? uid,
        'components': Map<String?, Object?> components,
        'exposed': Map<String?, Object?> exposed,
      } =>
        PlanBase(
          hid: hid,
          uid: uid,
          components: {
            for (final c in components.entries)
              c.key!: ComponentBase.create()
                ..mergeFromProto3Json(c.value as JsonMap)
          },
          exposed: {
            for (final p in exposed.entries)
              p.key!: PlanBase.create()..mergeFromProto3Json(p.value as JsonMap)
          },
        ),
      _ => throw ArgumentError(json.sjson),
    };
