part of '../../vast_world.dart';

class ChangeValueAct extends Act {
  ChangeValueAct({
    super.debugName,
    super.uid,
    required super.planId,
    required super.components,
  }) : super(type: ActTypeEnum.CHANGE_VALUE_ACT_TYPE);

  @override
  T innerRun<T>(T o) => switch (T.runtimeType) {
        (Lore v) => _runOnLore(v),
        _ => throw UnimplementedError(),
      } as T;

  Lore _runOnLore(Lore lore) {
    //lore.changeValue(planId: planId, values: values);
    lore.plans.update(planId!, (plan) {
      for (final e in components.entries) {
        plan.setComponent(e.value);
      }

      return plan;
    });

    return lore;
  }
}
