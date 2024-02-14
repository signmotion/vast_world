part of '../../../vast_world_share.dart';

class NotFoundError<T> extends Error {
  NotFoundError(
    ErrorExplainEnum code,
    this.name,
    this.value,
    StackTrace stackTrace,
  ) : super(code, '', stackTrace);

  @override
  String get message => 'Not found $name by `$value`.';

  /// Name of value for show in the [toString].
  final String name;

  final T value;

  @override
  List<Object?> get props => [...super.props, name, value];
}
