part of '../../../vast_world_share.dart';

class NotFoundError<T> extends Error {
  const NotFoundError(ErrorExplainEnum code, this.name, this.value)
      : super(code, '');

  @override
  String get message => 'Not found $name by `$value`.';

  /// Name of value for show in the [toString].
  final String name;

  final T value;

  @override
  List<Object?> get props => [...super.props, name, value];
}
