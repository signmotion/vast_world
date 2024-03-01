part of '../../../vast_world_share.dart';

/// The collection of all plans.
/// By analogy with [Component] and [Plan].
class Lore {
  Lore(
    this.u, {
    required this.componentBuilder,
    Map<String, Plan<Plan<dynamic>>>? plans,
  }) {
    // to fix error `Unmodifiable Map`
    this.plans = plans ?? Map.of({});

    final foundDifferent =
        this.plans.values.firstWhereOrNull((Plan<dynamic> p) => p.u != u);
    ae(
        this.plans.isEmpty || foundDifferent == null,
        'All plans should contain same Universe.'
        ' Found different for plan `${foundDifferent?.id}`.');
  }

  final Universe u;

  /// <[Plan.id], [Plan]>
  late final Map<String, Plan<Plan<dynamic>>> plans;

  final TComponentBuilder componentBuilder;

  /// This lore converted to [LoreBase].
  /// See [jsonAsBase].
  LoreBase get base => LoreBase(
        plans: {for (final p in plans.entries) p.key: p.value.base},
      );

  /// Count of [plans] into the [Lore].
  int get count => plans.length;

  /// Count of [Entity] into the [Universe].
  int get countEntitiesInUniverse => u.inner.entities.length;

  /// Add [plan] to [plans].
  /// Ignore when [plan] has been submitted.
  /// See [has].
  void addNew(Plan<Plan<dynamic>> plan) {
    ae(plan.id.isPlanId, 'Incorrect plan ID. `${plan.id}`');

    if (this[plan.id] == null) {
      this[plan.id] = plan;
    } else {
      throw ExistsPlanError(plan.id, StackTrace.current);
    }
  }

  /// Remove [planId] from [plans].
  /// Ignore when [plan] is absent.
  void remove(String planId) => plans.remove(planId);

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
    ae(plan != null, 'Plan `$id` not found.');

    plan!.setComponent(component);
  }

  /// The plan with [id] included into [Lore].
  /// See [find].
  bool has(String id) => find(id) != null;

  /// Return a plan by [id].
  Plan<Plan<dynamic>>? find(String id) =>
      plans[id] ??
      plans.values.firstWhereOrNull((p) => p.uid == id || p.hid == id);

  /// Return a plan by [id].
  Plan<Plan<dynamic>>? operator [](String id) => find(id);

  /// Set a plan by [id].
  void operator []=(String id, Plan<Plan<dynamic>> plan) {
    ae(id.isPlanId, 'Expected plan ID.');

    final present = find(id);
    if (present != null) {
      // TODO Clear a previous plan from Universe.
    }
    plans[plan.id] = plan;
  }

  void bind(String spectatorId, String watchedId) {
    ae(spectatorId.isPlanId, 'Expected plan ID for spectstor.');
    ae(watchedId.isPlanId, 'Expected plan ID for watched.');

    final spectator = this[spectatorId];
    ae(spectator != null, 'Spectator plan `$spectatorId` not found.');

    ae(has(watchedId), 'Watched plan `$watchedId` not found.');

    spectator!.bind(watchedId);
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
      _ => throw IllegalArgumentError('json', json.sjson, StackTrace.current),
    };
