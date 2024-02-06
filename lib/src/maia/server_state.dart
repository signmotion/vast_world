part of '../../../vast_world_maia.dart';

class ServerState extends AState<ServerStateBase> {
  const ServerState({
    required super.ss,
    required this.u,
    required this.lores,
    required this.loreInfluencer,
  });

  final Universe u;

  /// <session, Lore>
  final Map<String, Lore> lores;

  final LoreInfluencer loreInfluencer;

  @override
  ServerState copyWith({
    ServerStateBase? ss,
    Universe? u,
    Map<String, Lore>? lores,
    LoreInfluencer? loreInfluencer,
  }) =>
      ServerState(
        ss: ss ?? this.ss,
        u: u ?? this.u,
        lores: lores ?? this.lores,
        loreInfluencer: loreInfluencer ?? this.loreInfluencer,
      );

  @override
  List<Object?> get props => [...super.props, lores, loreInfluencer, u];
}

extension StateExt on ServerState {
  bool isClaimedSession(String session) =>
      ss.claimedSessionsDevices.containsKey(session);

  bool isApprovedSession(String session) =>
      ss.approvedSessions.containsKey(session);
}
