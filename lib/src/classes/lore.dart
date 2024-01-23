part of '../../vast_world.dart';

/// The collection of all plans.
class Lore {
  /// Add [plan] to [plans].
  void addNew(Plan<dynamic> plan) {
    //ae(this[plan.id] == null, 'Plan `${plan.id}` already exists into Lore.');
    if (this[plan.id] == null) {
      this[plan.id] = plan;
    }
  }

  /// Remove a previous plan if was present. The previous plan detecting by
  /// [plan.id].
  /// ! Replace UID into [plan].
  // void add(Plan<dynamic> plan) {
  //   //final prevPlanEntity = this[plan.id]?.innerEntity ?? plan.innerEntity;
  //   //for (final c in plan.u.inner.componentManager.components) {
  //   //print(c);
  //   //}
  //   plans.update(
  //     plan.id,
  //     (p) {
  //       for (final c in plan.u.inner.componentManager.components) {
  //         //final vc = c as VComponent<dynamic>;
  //         print(c);
  //       }
  //       p.u.inner.componentManager.components.clear();
  //       p.u.inner.componentManager.components
  //           .addAll(plan.u.inner.componentManager.components);

  //       // //p.u.removeEntity(p.innerEntity);
  //       // p.innerEntity = plan.innerEntity;
  //       // left an UID of the previous plan
  //       return p;
  //     },
  //     ifAbsent: () => plan,
  //   );
  //   //if (prevPlanEntity != plan.innerEntity) {
  //   // we should remove the entity from [Universe] of this [Plan]
  //   //  plan.u.removeEntity(prevPlanEntity);
  //   //}

  //   // final found = plans[plan.id];
  //   // //final prevUid = found?.uid ?? plan.uid;
  //   // if (found != null) {
  //   //   //found.delete();
  //   //   //plans.remove(plan.id);
  //   //   found.innerEntity = plan.innerEntity;
  //   // } else {
  //   //   plans[plan.id] = plan;
  //   // }
  //   // //plan.id = prevUid;
  //   // //plans[plan.id] = plan;
  // }

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
