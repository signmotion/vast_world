part of '../../../vast_world_share.dart';

class ChangeValueAct extends Act {
  ChangeValueAct({
    super.debugName,
    super.uid,
    required super.planId,
    required Iterable<AnyComponent> initializedComponents,
  }) : super(
          type: ActTypeEnum.CHANGE_VALUE_ACT_TYPE,
          components: {for (final ic in initializedComponents) ic.id: ic},
        );

  @override
  T innerRun<T>(
    Universe u,
    T o, {
    required TPlanBuilder planBuilder,
    required TComponentBuilder componentBuilder,
  }) {
    switch (o) {
      case final Lore lore:
        return _runOnLore(
          lore,
          planBuilder: planBuilder,
          componentBuilder: componentBuilder,
        ) as T;
      default:
        throw UnimplementedError();
    }
  }

  Lore _runOnLore(
    Lore lore, {
    required TPlanBuilder planBuilder,
    required TComponentBuilder componentBuilder,
  }) {
    //lore.changeValue(planId: planId, values: values);
    lore.plans.update(planId!, (plan) {
      for (final e in components.entries) {
        plan.setComponent(e.value, componentBuilder: componentBuilder);
      }

      return plan;
    });

    return lore;
  }
}
