part of '../../vast_world.dart';

/// The collection of all plans.
class Lore {
  /// Add [plan] to [plans].
  /// Remove a previous plan if was present. The previous plan detecting by
  /// [plan.id].
  /// ! Create a copy of [plan] if the [plan] was present and UIDs are different.
  void add(Plan<dynamic> plan) {
    final prevUid = plans[plan.id]?.uid;
    if (plans.containsKey(plan.id)) {
      plans.remove(plan.id);
    }
    plans[plan.id] = plan.id == prevUid ? plan : plan.copyWith(uid: prevUid);
  }

  /// Return a plan by [id].
  Plan<dynamic>? operator [](String id) =>
      plans[id] ?? plans.values.firstWhere((p) => p.uid == id || p.hid == id);

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
