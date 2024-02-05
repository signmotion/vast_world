part of '../../../vast_world_share.dart';

class PlanBuilder {
  const PlanBuilder(this.u);

  final Universe u;

  T fromJson<T extends Plan<dynamic>>(JsonMap json) =>
      fromBase(jsonAsPlanBase(json));

  T fromBase<T extends Plan<dynamic>>(PlanBase base) {
    logi('🧙‍♂️🟨 Constructing plan based on'
            ' `${base.shortMapWithSignificantFieldsMessage}...'
        .bittenOfAllUuids32);

    final plan = constructNothingPlan(
      u,
      hid: base.hid,
      uid: base.uid,
    );

    // components
    for (final cbase in base.components.values) {
      final component = const ComponentBuilder().fromBase(cbase);
      plan.setComponent(component);
    }

    // exposed
    for (final exposedBase in base.exposed.values) {
      final exposed = PlanBuilder(u).fromBase(exposedBase);
      plan.bind(exposed);
    }

    logi('🧙‍♂️💚 Plan `$plan` constructed.');

    return plan as T;
  }

  T fromIdAndComponents<T extends Plan<dynamic>>(
    String id,
    Iterable<AnyComponent> components,
  ) {
    logi('🧙‍♂️🟨 Constructing plan with ID `$id`'
            ' and components `$components`...'
        .bittenOfAllUuids32);

    final plan = constructNothingPlan(u, id: id);

    // components
    for (final component in components) {
      plan.setComponent(component);
    }

    logi('🧙‍♂️💚 Plan `$plan` constructed.');

    return plan as T;
  }
}
