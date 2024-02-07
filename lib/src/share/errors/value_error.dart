part of '../../../vast_world_share.dart';

abstract class ValueError<T> extends Error {
  const ValueError(ErrorExplainEnum code, this.name, this.value)
      : super(code, '$name `$value`');

  /// Name of value for show in the [toString].
  final String name;

  final T value;

  @override
  List<Object?> get props => [...super.props, name, value];
}
