part of '../../../vast_world_maia.dart';

/// By analogy with [ClientState].
class ServerState extends AState<ServerStateBase> {
  const ServerState({
    required super.ss,
    required this.u,
    required this.planBuilder,
    required this.componentBuilder,
    required this.lores,
    required this.loreInfluencer,
  });

  final Universe u;

  final TPlanBuilder planBuilder;
  final TComponentBuilder componentBuilder;

  /// <session, Lore>
  final Map<String, Lore> lores;

  final LoreInfluencer loreInfluencer;

  @override
  ServerState copyWith({
    ServerStateBase? ss,
    Universe? u,
    TComponentBuilder? componentBuilder,
    TPlanBuilder? planBuilder,
    Map<String, Lore>? lores,
    LoreInfluencer? loreInfluencer,
  }) =>
      ServerState(
        ss: ss ?? this.ss,
        u: u ?? this.u,
        planBuilder: planBuilder ?? this.planBuilder,
        componentBuilder: componentBuilder ?? this.componentBuilder,
        lores: lores ?? this.lores,
        loreInfluencer: loreInfluencer ?? this.loreInfluencer,
      );

  @override
  List<Object?> get props => [
        ...super.props,
        componentBuilder().runtimeType,
        planBuilder(u, componentBuilder).runtimeType,
        lores,
        loreInfluencer,
        u,
      ];

  /// Return a new state with same [u], [loreInfluencer] and [componentBuilder].
  ServerState fromJson(JsonMap json) => throw UnimplementedError();

  JsonMap toJson() => throw UnimplementedError();
}

extension StateExt on ServerState {
  bool isClaimedSession(String session) =>
      ss.claimedSessionsDevices.containsKey(session);

  bool isApprovedSession(String session) =>
      ss.approvedSessions.containsKey(session);
}
