part of '../../../vast_world_share.dart';

abstract class PlanError extends Error {
  const PlanError(super.code, super.message, {required this.planId});

  final String planId;

  @override
  List<Object?> get props => [...super.props, planId];
}

class AlreadyExistsPlanError extends PlanError {
  const AlreadyExistsPlanError(String planId)
      : super(
          ErrorExplainEnum.EXISTS_PLAN_ERROR_EXPLAIN,
          'Plan already exists.',
          planId: planId,
        );
}
