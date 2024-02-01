part of '../../../vast_world_maia.dart';

class ServerState extends AState<ServerStateBase> {
  const ServerState({
    required super.ss,
    required this.lores,
  });

  /// <session, Lore>
  final Map<String, Lore> lores;

  @override
  ServerState copyWith({
    ServerStateBase? ss,
    Map<String, Lore>? lores,
  }) =>
      ServerState(
        ss: ss ?? this.ss,
        lores: lores ?? this.lores,
      );
}

extension StateExt on ServerState {
  bool isClaimedSession(String session) =>
      ss.claimedSessionsDevices.containsKey(session);

  bool isApprovedSession(String session) =>
      ss.approvedSessions.containsKey(session);
}
