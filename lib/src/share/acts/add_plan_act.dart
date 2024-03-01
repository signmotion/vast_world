part of '../../../vast_world_share.dart';

class AddPlanAct extends Act {
  AddPlanAct({
    super.debugName,
    super.uid,
    required super.spectatorId,
    required super.planId,
    Iterable<AnyComponent> initializedComponents = const [],
  }) : super(
          type: ActTypeEnum.ADD_PLAN_ACT_TYPE,
          components: {for (final ic in initializedComponents) ic.id: ic},
        );

  factory AddPlanAct.fromPlan(String spectatorId, Plan<Plan<dynamic>> plan) =>
      AddPlanAct(
        debugName: 'AddPlanAct.${plan.id}',
        spectatorId: spectatorId,
        planId: plan.id,
        initializedComponents: plan.components,
      );

  @override
  T innerRunOnClient<T>(
    Universe u,
    T o, {
    required TPlanBuilder planBuilder,
    required TComponentBuilder componentBuilder,
  }) =>
      innerRunOnServer(
        u,
        o,
        planBuilder: planBuilder,
        componentBuilder: componentBuilder,
      );

  @override
  T innerRunOnServer<T>(
    Universe u,
    T o, {
    required TPlanBuilder planBuilder,
    required TComponentBuilder componentBuilder,
  }) =>
      switch (o) {
        Lore lore => _runOnLore(
            lore,
            planBuilder: planBuilder,
            componentBuilder: componentBuilder,
          ) as T,
        _ => throw UnimplementedError(),
      };

  Lore _runOnLore(
    Lore lore, {
    required TPlanBuilder planBuilder,
    required TComponentBuilder componentBuilder,
  }) {
    final b = planBuilder(lore);
    final plan = b.fromIdAndComponents(planId!, components.values);
    // lore.addNew(plan); - already added when constructed

    // expose this plan to spectator's plan
    if ((spectatorId ?? '').isEmpty) {
      logw('Added plan `${plan.id}` without spectator.');
    } else {
      lore.bind(spectatorId!, plan.id);
    }

    return lore;
  }
}
