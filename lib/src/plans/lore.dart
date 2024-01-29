part of '../../vast_world.dart';

/// The collection of all plans.
class Lore {
  //Lore(this.base);

  late LoreBase base;

  /// Add [plan] to [plans].
  /// Ignore when [plan] has been submitted.
  void addNew(Plan<dynamic> plan) {
    _addNewIntoBase(plan);
    _addNewIntoRoot(plan);
  }

  void _addNewIntoBase(Plan<dynamic> plan) {
    if (base.plans[plan.id] == null) {
      base.plans[plan.id] = plan.base;
    }
  }

  void _addNewIntoRoot(Plan<dynamic> plan) {
    if (this[plan.id] == null) {
      this[plan.id] = plan;
    }
  }

  /// Replace a [data] for component [T], plan [id].
  void update<T extends Component<V>, V>(
    String id,
    oxygen.ComponentBuilder<T> componentBuilder,
    V data,
  ) {
    _updateIntoBase(id, componentBuilder, data);
    _updateIntoRoot(id, componentBuilder, data);
  }

  void _updateIntoBase<T extends Component<V>, V>(
    String id,
    oxygen.ComponentBuilder<T> componentBuilder,
    V data,
  ) {
    final plan = base.plans[id];
    ae(plan != null, 'Plan `$id` not found in the base.');

    // TODO plan!.set<T, V>(componentBuilder, data);
  }

  void _updateIntoRoot<T extends Component<V>, V>(
    String id,
    oxygen.ComponentBuilder<T> componentBuilder,
    V data,
  ) {
    final plan = this[id];
    ae(plan != null, 'Plan `$id` not found in the root.');

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

  /// Count of [plans] into the [Lore].
  int get count => plans.length;

  /// Count of [Entity] into the [Universe].
  Iterable<int> get countsInUniverses =>
      universes.map((u) => u.inner.entities.length);

  /// <[Plan.id], [Plan]>
  final Map<String, Plan<dynamic>> plans = {};

  /// All unique [Universe]s from [plans].
  Set<Universe> get universes => {...plans.values.map((p) => p.u)};

  @override
  String toString() => '${base.shortMapWithSignificantFieldsMessage.blured()}';
}
