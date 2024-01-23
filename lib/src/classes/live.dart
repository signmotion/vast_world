part of '../../vast_world.dart';

/// The pool for all plans.
class Live {
  Live();

  /// Add [plan] to [plans].
  /// Remove a previous plan if was present. The previous plan detecting by
  /// [plan.id].
  void add(Plan<dynamic> plan) {
    final prevUid = plans[plan.id]?.uid;
    if (plans.containsKey(plan.id)) {
      plans.remove(plan.id);
    }
    plans[plan.id] = plan.copyWith(uid: prevUid);
  }

  Plan<dynamic>? operator [](String id) => plans[id];

  int get count => plans.length;

  /// <[Plan.id], [Plan]>
  final Map<String, Plan<dynamic>> plans = {};

  /// All unique [Universe]s from [plans].
  Set<Universe> get universes => {...plans.values.map((p) => p.u)};
}
