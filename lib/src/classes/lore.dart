part of '../../vast_world.dart';

/// The collection of all plans.
class Lore {
  /// Add [plan] to [plans].
  /// Ignore when [plan] has been submitted.
  void addNew(Plan<dynamic> plan) {
    if (this[plan.id] == null) {
      this[plan.id] = plan;
    }
  }

  /// Replace a [data] for component [T], plan [id].
  void update<T extends VComponent<V>, V>(
    String id,
    ComponentBuilder<T> componentBuilder,
    V data,
  ) {
    final plan = this[id];
    ae(plan != null, 'Plan `{pland.id}` not found.');

    plan!.set<T, V>(componentBuilder, data);
  }

  /// The plan with [id] included into [Lore].
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

    pa!.addToImpacts(pb);
  }

  /// Count of [plans].
  int get count => plans.length;

  /// <[Plan.id], [Plan]>
  final Map<String, Plan<dynamic>> plans = {};

  /// All unique [Universe]s from [plans].
  Set<Universe> get universes => {...plans.values.map((p) => p.u)};
}
