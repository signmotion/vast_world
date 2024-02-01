part of '../../../vast_world_maia.dart';

abstract class SessionError extends Error {
  const SessionError(super.message, {required this.session});

  final String session;

  @override
  List<Object?> get props => [...super.props, session];
}

class NotClaimedSessionError extends SessionError {
  const NotClaimedSessionError(String session)
      : super('Session is not claimed.', session: session);
}

class NotApprovedSessionError extends SessionError {
  const NotApprovedSessionError(String session)
      : super('Session is not approved.', session: session);
}
