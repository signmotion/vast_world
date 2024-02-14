part of '../../../vast_world_share.dart';

abstract class PlanError extends Error {
  PlanError(
    super.code,
    super.message,
    super.stackTrace, {
    required this.planId,
  });

  final String planId;

  @override
  List<Object?> get props => [...super.props, planId];
}

class AlreadyExistsPlanError extends PlanError {
  AlreadyExistsPlanError(String planId, StackTrace stackTrace)
      : super(
          ErrorExplainEnum.EXISTS_PLAN_ERROR_EXPLAIN,
          'Plan already exists.',
          stackTrace,
          planId: planId,
        );
}
