// ignore_for_file: inference_failure_on_function_invocation

part of '../../vast_world.dart';

/// An 'absolute plan' with own [Universe].
/// Use for some renders.
class AbsolutePlan extends Plan<Plan> {
  AbsolutePlan() : super(Universe());
}
