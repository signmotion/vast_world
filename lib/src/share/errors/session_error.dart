part of '../../../vast_world_share.dart';

abstract class SessionError extends Error {
  const SessionError(super.code, super.message, {required this.session});

  final String session;

  @override
  List<Object?> get props => [...super.props, session];
}

class NotClaimedSessionError extends SessionError {
  const NotClaimedSessionError(String session)
      : super(
          ErrorExplainEnum.NOT_CLAIMED_SESSION_ERROR_EXPLAIN,
          'Session is not claimed.',
          session: session,
        );
}

class NotApprovedSessionError extends SessionError {
  const NotApprovedSessionError(String session)
      : super(
          ErrorExplainEnum.NOT_APPROVED_SESSION_ERROR_EXPLAIN,
          'Session is not approved.',
          session: session,
        );
}
