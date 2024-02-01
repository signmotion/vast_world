part of '../../../vast_world_share.dart';

/// Can act as the basis for any plan.
Plan<dynamic> constructNothingPlan(
  Universe u, {
  String? hid,
  String? uid,
}) =>
    Plan(u, hid: hid, uid: uid);
