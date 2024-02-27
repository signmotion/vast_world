part of '../../../vast_world_share.dart';

/// Can act as the basis for any plan.
Plan<Plan<dynamic>> constructNothingPlan(
  Universe u, {
  String? id,
  String? hid,
  String? uid,
  required TComponentBuilder componentBuilder,
}) =>
    Plan(u, id: id, hid: hid, uid: uid, componentBuilder: componentBuilder);
