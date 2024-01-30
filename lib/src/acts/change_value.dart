part of '../../vast_world.dart';

class ChangeValueAct extends Act {
  ChangeValueAct({
    super.debugName,
    super.uid,
    required super.planId,
    required super.values,
  }) : super(type: ActTypeEnum.CHANGE_VALUE_ACT_TYPE);

  @override
  T innerRun<T>(T o) => switch (T.runtimeType) {
        (Lore v) => _runOnLore(v),
        _ => throw UnimplementedError(),
      } as T;

  Lore _runOnLore(Lore lore) {
    //lore.changeValue(planId: planId, values: values);
    lore.plans.update(planId!, (plan) {
      for (final e in values.entries) {
        final (_, componentJson) = (e.key, e.value);
        final component =
            const ComponentBuilder().fromJson(componentJson.jsonMap);
        plan.setComponent(component);

        // final component =
        //     plan.components.firstWhereOrNull((c) => c.id == componentId);
        // final base = component.base..sjsonValue = componentJson;
        // final newComponent = const ComponentBuilder().fromBase(base);
        // plan.setComponent(newComponent);

        // final builder = ComponentBuilder().builder(base.uid);
        // final json = base.sjsonValue.jsonMap;
        // final value = component.jsonAsValue(json);
        // plan.set(builder, value);
      }

      return plan;
    });

    return lore;
  }
}
