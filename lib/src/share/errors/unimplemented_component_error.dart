part of '../../../vast_world_share.dart';

class UnimplementedComponentError extends Error {
  UnimplementedComponentError(
    StackTrace stackTrace, {
    required this.componentId,
    required this.componentBuilder,
  })  : assert(componentId.isNotEmpty),
        super(
          ErrorExplainEnum.UNIMPLEMENTED_COMPONENT_ERROR_EXPLAIN,
          'Component `$componentId` not found into `$componentBuilder`.',
          stackTrace,
        );

  final String componentId;
  final Type componentBuilder;

  @override
  List<Object?> get props => [...super.props, componentId];
}
