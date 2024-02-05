part of '../../../vast_world_share.dart';

class PlanBuilder {
  const PlanBuilder(this.u);

  final Universe u;

  T fromJson<T extends Plan<dynamic>>(JsonMap json) =>
      fromBase(jsonAsPlanBase(json));

  T fromBase<T extends Plan<dynamic>>(PlanBase base) {
    logi('🧙‍♂️🟨 Constructing plan based on'
            ' `${base.shortMapWithSignificantFieldsMessage} with components'
            ' `${base.components.values.map((c) => c.hid)}`...'
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

    logi('🧙‍♂️💚 Plan `$plan` constructed with components'
        ' `${plan.componentsBuilders.map((b) => b().runtimeType)}`');

    return plan as T;
  }

  T fromIdAndComponents<T extends Plan<dynamic>>(
    String id,
    Iterable<AnyComponent> components,
  ) {
    logi('🧙‍♂️🟨 Constructing plan with ID `$id` and components'
            ' `${components.map((c) => c.runtimeType)}`...'
        .bittenOfAllUuids32);

    final plan = constructNothingPlan(u, id: id);

    // components
    for (final component in components) {
      plan.setComponent(component);
    }

    logi('🧙‍♂️💚 Plan `$plan` constructed with components'
        ' `${plan.componentsBuilders.map((b) => b().runtimeType)}`');

    return plan as T;
  }
}
