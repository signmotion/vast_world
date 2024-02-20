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

class ExistsPlanError extends PlanError {
  ExistsPlanError(String planId, StackTrace stackTrace)
      : super(
          ErrorExplainEnum.EXISTS_PLAN_ERROR_EXPLAIN,
          'Plan exists.',
          stackTrace,
          planId: planId,
        );
}

class AbsentPlanError extends PlanError {
  AbsentPlanError(String planId, StackTrace stackTrace)
      : super(
          ErrorExplainEnum.ABSENT_PLAN_ERROR_EXPLAIN,
          'Plan absents.',
          stackTrace,
          planId: planId,
        );
}
