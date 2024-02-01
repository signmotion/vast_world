part of '../../../vast_world_maia.dart';

class ServerState extends AState<ServerStateBase> {
  const ServerState({
    required super.ss,
    required this.u,
    required this.lores,
  });

  final Universe u;

  /// <session, Lore>
  final Map<String, Lore> lores;

  @override
  ServerState copyWith({
    ServerStateBase? ss,
    Universe? u,
    Map<String, Lore>? lores,
  }) =>
      ServerState(
        ss: ss ?? this.ss,
        u: u ?? this.u,
        lores: lores ?? this.lores,
      );

  @override
  List<Object?> get props => [...super.props, lores, u];
}

extension StateExt on ServerState {
  bool isClaimedSession(String session) =>
      ss.claimedSessionsDevices.containsKey(session);

  bool isApprovedSession(String session) =>
      ss.approvedSessions.containsKey(session);
}
