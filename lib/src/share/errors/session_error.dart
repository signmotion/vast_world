part of '../../../vast_world_share.dart';

abstract class SessionError extends Error {
  SessionError(
    super.code,
    super.message,
    super.stackTrace, {
    required this.session,
  });

  final String session;

  @override
  List<Object?> get props => [...super.props, session];
}

class IllegalSessionUidError extends ArgumentError<String> {
  IllegalSessionUidError(String session, StackTrace stackTrace)
      : super(
          ErrorExplainEnum.ILLEGAL_SESSION_UID_ERROR_EXPLAIN,
          'Illegal session UID',
          session,
          stackTrace,
        );
}

class NotClaimedSessionError extends SessionError {
  NotClaimedSessionError(String session, StackTrace stackTrace)
      : super(
          ErrorExplainEnum.NOT_CLAIMED_SESSION_ERROR_EXPLAIN,
          'Session is not claimed.',
          stackTrace,
          session: session,
        );
}

class NotApprovedSessionError extends SessionError {
  NotApprovedSessionError(String session, StackTrace stackTrace)
      : super(
          ErrorExplainEnum.NOT_APPROVED_SESSION_ERROR_EXPLAIN,
          'Session is not approved.',
          stackTrace,
          session: session,
        );
}
