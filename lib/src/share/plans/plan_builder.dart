part of '../../../vast_world_share.dart';

typedef TPlanBuilder
    = T2Builder<NativePlanBuilder, Universe, TComponentBuilder>;

class NativePlanBuilder {
  const NativePlanBuilder(
    this.u,
    this.componentBuilder,
  );

  final Universe u;

  /// We can use inheritanced builder.
  final TComponentBuilder componentBuilder;

  T fromJson<T extends Plan<dynamic>>(JsonMap json) =>
      fromBase(jsonAsPlanBase(json));

  T fromBase<T extends Plan<dynamic>>(PlanBase base) {
    logi('🧙‍♂️🟨 Constructing plan based on'
            ' `${base.hid}` with components'
            ' `${base.components.values.map((c) => c.hid)}`'
            ' with builder `$runtimeType`...'
        .bittenOfAllUuids32);

    final plan = constructNothingPlan(
      u,
      hid: base.hid,
      uid: base.uid,
      componentBuilder: componentBuilder,
    );

    // components
    for (final cbase in base.components.values) {
      final component = componentBuilder().fromBase(cbase);
      plan.setComponent(component);
    }

    // exposed
    for (final exposedBase in base.exposed.values) {
      final exposed = fromBase(exposedBase);
      plan.bind(exposed);
    }

    logi('🧙‍♂️💚 Plan `$plan` constructed with components'
        ' `${plan.componentsBuilders.map((b) => b())}`');

    return plan as T;
  }

  T fromIdAndComponents<T extends Plan<dynamic>>(
    String id,
    Iterable<AnyComponent> components,
  ) {
    logi('🧙‍♂️🟨 Constructing plan with ID `$id` and components'
            ' `${components.map((c) => c.runtimeType)}`...'
        .bittenOfAllUuids32);

    final plan =
        constructNothingPlan(u, id: id, componentBuilder: componentBuilder);

    // components
    for (final component in components) {
      plan.setComponent(component);
    }

    logi('🧙‍♂️💚 Plan `$plan` constructed with components'
        ' `${plan.componentsBuilders.map((b) => b())}`');

    return plan as T;
  }

  @override
  String toString() => '$runtimeType ${componentBuilder()}';
}
