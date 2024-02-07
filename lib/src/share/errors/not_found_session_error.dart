part of '../../../vast_world_share.dart';

class NotFoundSessionError<T> extends NotFoundError<T> {
  const NotFoundSessionError(
    super.code,
    super.name,
    super.value,
    this.session,
  );

  @override
  String get message => '${super.message} Session: `$session`.';

  final String session;

  @override
  List<Object?> get props => [...super.props, session];
}
