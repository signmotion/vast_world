part of '../../vast_world_hermes.dart';

/// By analogy with [ServerState].
class ClientState extends AState<ClientStateBase> {
  const ClientState({
    required super.ss,
    required this.lore,
    required this.planBuilder,
    required this.loreInfluencer,
  });

  final TPlanBuilder planBuilder;
  TComponentBuilder get componentBuilder => lore.componentBuilder;

  final Lore lore;

  Universe get u => lore.u;

  final LoreInfluencer loreInfluencer;

  @override
  ClientState copyWith({
    ClientStateBase? ss,
    Lore? lore,
    TPlanBuilder? planBuilder,
    LoreInfluencer? loreInfluencer,
  }) =>
      ClientState(
        ss: ss ?? this.ss,
        lore: lore ?? this.lore,
        planBuilder: planBuilder ?? this.planBuilder,
        loreInfluencer: loreInfluencer ?? this.loreInfluencer,
      );

  @override
  List<Object?> get props => [
        ...super.props,
        lore,
        planBuilder(lore).runtimeType,
        loreInfluencer,
      ];

  /// Return a new state with same [u], [loreInfluencer] and [componentBuilder].
  ClientState fromJson(JsonMap json) {
    return switch (json) {
      {
        'ss': Map<String?, Object?> ss,
        'lore': Map<String?, Object?> loreJson,
      } =>
        ClientState(
          ss: ClientStateBase.fromJson(ss.sjson),
          lore: LoreBuilder(
            u,
            planBuilder: planBuilder,
            componentBuilder: componentBuilder,
          ).fromJson(loreJson as JsonMap),
          planBuilder: planBuilder,
          loreInfluencer: loreInfluencer,
        ),
      _ => throw IllegalArgumentError('json', json.sjson, StackTrace.current),
    };
  }

  JsonMap toJson() => {
        'ss': ss.toProto3Json() as JsonMap,
        'lore': lore.base.toProto3Json() as JsonMap,
      };
}
