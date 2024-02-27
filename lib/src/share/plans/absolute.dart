// ignore_for_file: inference_failure_on_function_invocation

part of '../../../vast_world_share.dart';

/// An 'absolute plan' with default [Universe].
/// Use for some renders.
class AbsolutePlan extends Plan<Plan> {
  AbsolutePlan()
      : super(_universe, componentBuilder: NativeComponentBuilder.new);

  @override
  String get hid => absolutePlanHid;

  @override
  String get uid => absolutePlanUid;
}

final _universe = Universe();
