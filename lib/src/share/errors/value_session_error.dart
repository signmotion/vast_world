part of '../../../vast_world_share.dart';

/// Any value with [session].
class ValueSessionError<T> extends ArgumentError<T> {
  ValueSessionError(
    super.code,
    super.name,
    super.value,
    super.stackTrace,
    this.session,
  );

  @override
  String get message => '${super.message} Session: `$session`.';

  final String session;

  @override
  List<Object?> get props => [...super.props, session];
}
