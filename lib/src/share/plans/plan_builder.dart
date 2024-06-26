part of '../../../vast_world_share.dart';

typedef TPlanBuilder = T1Builder<NativePlanBuilder, Lore>;

/// ! Adds the constructed plan itno [Lore].
class NativePlanBuilder {
  const NativePlanBuilder(this.lore);

  final Lore lore;

  /// We can use inheritanced builder.
  TComponentBuilder get componentBuilder => lore.componentBuilder;

  T fromJson<T extends Plan>(JsonMap json) => fromBase(jsonAsPlanBase(json));

  T fromBase<T extends Plan>(PlanBase base) {
    logger.i('🧙‍♂️🟨 Constructing plan based on'
            ' `${base.hid}` with components'
            ' `${base.components.values.map((c) => c.hid)}`'
            ' with builder `$runtimeType`...'
        .bittenOfAllUuids32);

    final plan = constructNothingPlanIntoLore(
      lore,
      hid: base.hid,
      uid: base.uid,
    );

    // components
    for (final cbase in base.components.values) {
      final component = componentBuilder().fromBase(cbase);
      plan.setComponent(component);
    }

    // exposed
    plan.addAllToExposed(base.exposedIds);

    logger.i('🧙‍♂️💚 Plan `${plan.sjsonInLine}` constructed with components'
        ' `${plan.componentsBuilders.map((b) => b())}`');

    return plan as T;
  }

  T fromIdAndComponents<T extends Plan>(
    String id,
    Iterable<AnyComponent> components,
  ) {
    logger.i('🧙‍♂️🟨 Constructing plan with ID `$id` and components'
            ' `${components.map((c) => c.runtimeType)}`...'
        .bittenOfAllUuids32);

    final plan = constructNothingPlanIntoLore(lore, id: id);

    // components
    for (final component in components) {
      plan.setComponent(component);
    }

    logger.i('🧙‍♂️💚 Plan `${plan.sjsonInLine}` constructed with components'
        ' `${plan.componentsBuilders.map((b) => b())}`');

    return plan as T;
  }

  @override
  String toString() => '$runtimeType ${componentBuilder()}';
}
