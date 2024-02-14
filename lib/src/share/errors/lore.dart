part of '../../../vast_world_share.dart';

abstract class LoreError extends Error {
  LoreError(super.code, super.message, super.stackTrace);
}

class AbsentSessionLoreError extends LoreError {
  AbsentSessionLoreError(String session, StackTrace stackTrace)
      : super(
          ErrorExplainEnum.ABSENT_SESSION_LORE_ERROR_EXPLAIN,
          'Lore for session `$session` not found.',
          stackTrace,
        );
}
