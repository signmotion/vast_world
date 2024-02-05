part of '../../../vast_world_share.dart';

class AddPlanAct extends Act {
  AddPlanAct({
    super.debugName,
    super.uid,
    required super.planId,
    Iterable<AnyComponent> initializedComponents = const [],
  }) : super(
          type: ActTypeEnum.ADD_PLAN_ACT_TYPE,
          components: {for (final ic in initializedComponents) ic.id: ic},
        );

  @override
  T innerRun<T>(Universe u, T o) {
    switch (o) {
      case final Lore lore:
        return _runOnLore(u, lore) as T;
      default:
        throw UnimplementedError();
    }
  }

  Lore _runOnLore(Universe u, Lore lore) {
    final plan = PlanBuilder(u).fromIdAndComponents(planId!, components.values);
    lore.addNew(plan);

    return lore;
  }
}
