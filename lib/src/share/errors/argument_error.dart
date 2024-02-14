part of '../../../vast_world_share.dart';

abstract class ArgumentError<T> extends Error {
  ArgumentError(
    ErrorExplainEnum code,
    this.name,
    this.value,
    StackTrace stackTrace,
  ) : super(code, '$name `$value`', stackTrace);

  /// Name of argument for show in the [toString].
  final String name;

  final T value;

  @override
  List<Object?> get props => [...super.props, name, value];
}

class IllegalArgumentError<T> extends ArgumentError<T> {
  IllegalArgumentError(String name, T value, StackTrace stackTrace)
      : super(
          ErrorExplainEnum.ILLEGAL_ARGUMENT_ERROR_EXPLAIN,
          name,
          value,
          stackTrace,
        );
}
