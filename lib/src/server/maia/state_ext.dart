part of '../../../vast_world_server.dart';

extension StateExt on State {
  bool isClaimedSession(String session) =>
      ss.claimedSessionsDevices.containsKey(session);

  bool isApprovedSession(String session) =>
      ss.approvedSessions.containsKey(session);
}
