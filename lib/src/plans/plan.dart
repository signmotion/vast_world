// ignore_for_file: inference_failure_on_function_invocation

part of '../../vast_world.dart';

/// [render] Constructing a representation the [I] to this plan.
/// ! Call [removeInnerEntity()] if working with a set of plans and removing the plan.
class Plan<I extends Plan<dynamic>> extends Quant {
// TODO class Plan<I extends Plan<dynamic>, L extends LayoutComponent> extends Quant {
  Plan(
    this.u, {
    String? hid,
    String? uid,
    //L? layoutForExposed,
  }) {
    this.hid = hid ?? '';
    this.uid = uid ?? genUuid;

    // to fix error `UnmodifiableList`
    this.impactsOnPlans = List<I>.empty(growable: true);

    // an one entity on each plan
    final debugId = id;
    innerEntity = u.construct(debugId);

    set<IdComponent, IdT>(IdComponent.new, (hid: this.hid, uid: this.uid));
    // TODO set<LayoutComponent>(layoutForExposed.builder);
  }

  final Universe u;

  /// [value] converted to [PlanBase].
  PlanBase get base {
    print(components);

    //final components = <String, ComponentBase>{};
    //for (final c in u.componentManager.components)

    return PlanBase(
      hid: hid,
      uid: uid,
      components: {},
      exposed: {},
    );
  }

  List<Component<dynamic>> get components {
    /// we can't access to components for [innerEntity] into Oxygen
    /// TODO(sign): optimize
    final l = <Component<dynamic>?>[
      ie.get<DescriptionComponent>(),
      ie.get<IdComponent>(),
      ie.get<ListComponent<dynamic>>(),
      ie.get<NameComponent>(),
      ie.get<PictureComponent>(),
      ie.get<StoryComponent>(),
      ie.get<StringComponent>(),
      ie.get<TiledmapRenderComponent>(),
    ];
    final r = <Component<dynamic>>[];
    for (final c in l) {
      if (c != null) {
        r.add(c);
      }
    }

    return r;
  }

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
  T? component<T extends Component<dynamic>>() => ie.get<T>();

  /// Alias [component].
  T? get<T extends Component<dynamic>>() => component<T>();

  /// Set a component value and register the component when it absent.
  /// See [addComponent], [Component], [component].
  void set<T extends Component<V>, V>(
    oxygen.ComponentBuilder<T> builder, [
    V? data,
  ]) {
    u.registerComponent(builder);

    final c = component<T>();
    if (c == null) {
      ie.add<T, V>(data);
    } else {
      c.init(data);
    }
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

    impactsOnPlans.add(plan);
  }
}
