part of '../../vast_world.dart';

class PlanBuilder {
  const PlanBuilder(this.universe);

  final Universe universe;

  T fromJson<T extends Plan<dynamic>>(JsonMap json) =>
      fromBase(jsonAsPlanBase(json));

  T fromBase<T extends Plan<dynamic>>(PlanBase base) {
    logi('🧙‍♂️🟨 Constructing plan based on '
            '`${base.shortMapWithSignificantFieldsMessage}...'
        .bittenOfAllUuids32);

    final plan = constructNothingPlan(
      universe,
      hid: base.hid,
      uid: base.uid,
    );

    // components
    for (final componentBase in base.components.values) {
      final component = const ComponentBuilder().fromBase(componentBase);
      plan.setComponent(component);
    }

    // exposed
    for (final exposedBase in base.exposed.values) {
      final exposed = PlanBuilder(universe).fromBase(exposedBase);
      plan.bind(exposed);
    }

    logi('🧙‍♂️💚 Plan `$plan` constructed.');

    return plan as T;
  }
}
