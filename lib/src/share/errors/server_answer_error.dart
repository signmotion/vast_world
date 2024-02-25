part of '../../../vast_world_share.dart';

/// Wrapper for Client.
class ServerAnswerError extends SessionError {
  ServerAnswerError(
    ServerAnswer answer,
    StackTrace stackTrace,
  ) : super(
          answer.codeExplain,
          answer.messageExplain,
          stackTrace,
          session: answer.session,
        );
}
