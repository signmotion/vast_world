part of '../../../vast_world_share.dart';

/// The collection of all plans.
/// By analogy with [Component] and [Plan].
class Lore {
  Lore({
    required this.componentBuilder,
    Map<String, Plan<dynamic>>? plans,
  }) : plans = plans ?? {};

  /// <[Plan.id], [Plan]>
  final Map<String, Plan<dynamic>> plans;

  final TBuilder<NativeComponentBuilder> componentBuilder;

  /// This act converted to [ActBase].
  /// See [jsonAsBase].
  LoreBase get base => LoreBase(
        plans: {for (final p in plans.entries) p.key: p.value.base},
      );

  /// Count of [plans] into the [Lore].
  int get count => plans.length;

  /// Count of [Entity] into the [Universe].
  Iterable<int> get countsInUniverses =>
      universes.map((u) => u.inner.entities.length);

  /// All unique [Universe]s from [plans].
  Set<Universe> get universes => {...plans.values.map((p) => p.u)};

  /// Add [plan] to [plans].
  /// Ignore when [plan] has been submitted.
  /// See [has].
  void addNew(Plan<dynamic> plan) {
    if (this[plan.id] == null) {
      this[plan.id] = plan;
    } else {
      throw AlreadyExistsPlanError(plan.id);
    }
  }

  /// Replace a [data] for component [C], plan [id].
  void update<C extends Component<V>, V>(
    String id,
    oxygen.ComponentBuilder<C> componentBuilder,
    V data,
  ) {
    final plan = this[id];
    ae(plan != null, 'Plan `$id` not found in the root.');

    plan!.set<C, V>(componentBuilder, data);
  }

  /// Replace a [data] for component [T], plan [id].
  void updateComponent(
    String id,
    AnyComponent component,
  ) {
    final plan = this[id];
    ae(plan != null, 'Plan `$id` not found in the root.');

    plan!.setComponent(component, componentBuilder: componentBuilder);
  }

  /// The plan with [id] included into [Lore].
  /// See [find].
  bool has(String id) => find(id) != null;

  /// Return a plan by [id].
  Plan<dynamic>? find(String id) =>
      plans[id] ??
      plans.values.firstWhereOrNull((p) => p.uid == id || p.hid == id);

  /// Return a plan by [id].
  Plan<dynamic>? operator [](String id) => find(id);

  /// Set a plan by [id].
  void operator []=(String id, Plan<dynamic> plan) {
    final present = find(id);
    if (present != null) {
      // TODO Clear a previous plan from Universe.
    }
    plans[plan.id] = plan;
  }

  void bind(String a, String b) {
    final pa = this[a];
    ae(pa != null, 'Plan `$a` not found.');

    final pb = this[b];
    ae(pb != null, 'Plan `$b` not found.');

    pa!.bind(pb);
  }

  @override
  String toString() => '${base.shortMapWithSignificantFieldsMessage}';

  /// See [base].
  /// See [jsonAsLoreBase].
  LoreBase jsonAsBase(JsonMap json) => jsonAsLoreBase(json);
}

LoreBase jsonAsLoreBase(JsonMap json) => switch (json) {
      {
        'plans': Map<String?, Object?> plans,
      } =>
        LoreBase(
          plans: {
            for (final p in plans.entries)
              p.key!: PlanBase.create()..mergeFromProto3Json(p.value as JsonMap)
          },
        ),
      _ => throw ArgumentError(json.sjson),
    };
