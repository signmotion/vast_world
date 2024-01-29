// ignore_for_file: inference_failure_on_function_invocation

part of '../../vast_world.dart';

Plan<dynamic> constructNothingPlan(
  Universe u, {
  String? hid = '',
  String? uid = '',
}) =>
    Plan(u, hid: hid, uid: uid);
