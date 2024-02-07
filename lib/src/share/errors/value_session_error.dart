part of '../../../vast_world_share.dart';

/// Any value with [session].
class ValueSessionError<T> extends ValueError<T> {
  const ValueSessionError(
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

class IllegalUidSessionError extends ValueSessionError<String> {
  const IllegalUidSessionError(String session)
      : super(
          ErrorExplainEnum.ILLEGAL_UID_SESSION_ERROR_EXPLAIN,
          'session UID',
          session,
          session,
        );
}
