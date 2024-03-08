part of '../../../vast_world_share.dart';

/// Can act as the basis for any plan.
/// ! Adds the created plan to [lore].
Plan constructNothingPlanIntoLore(
  Lore lore, {
  String? id,
  String? hid,
  String? uid,
}) {
  final plan = Plan(
    lore.u,
    id: id,
    hid: hid,
    uid: uid,
    componentBuilder: lore.componentBuilder,
  );
  lore.addNewOrUpdate(plan);

  return plan;
}
