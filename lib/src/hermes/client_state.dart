part of '../../vast_world_hermes.dart';

/// By analogy with [ServerState].
class ClientState extends AState<ClientStateBase> {
  const ClientState({
    required super.ss,
    required this.u,
    required this.planBuilder,
    required this.componentBuilder,
    required this.lore,
    required this.loreInfluencer,
  });

  final Universe u;

  final TPlanBuilder planBuilder;
  final TComponentBuilder componentBuilder;

  final Lore lore;

  final LoreInfluencer loreInfluencer;

  @override
  ClientState copyWith({
    ClientStateBase? ss,
    Universe? u,
    TComponentBuilder? componentBuilder,
    TPlanBuilder? planBuilder,
    Lore? lore,
    LoreInfluencer? loreInfluencer,
  }) =>
      ClientState(
        ss: ss ?? this.ss,
        u: u ?? this.u,
        planBuilder: planBuilder ?? this.planBuilder,
        componentBuilder: componentBuilder ?? this.componentBuilder,
        lore: lore ?? this.lore,
        loreInfluencer: loreInfluencer ?? this.loreInfluencer,
      );

  @override
  List<Object?> get props => [
        ...super.props,
        componentBuilder().runtimeType,
        planBuilder(u, componentBuilder).runtimeType,
        lore,
        loreInfluencer,
        u,
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
          u: u,
          planBuilder: planBuilder,
          componentBuilder: componentBuilder,
          lore: LoreBuilder(
            u,
            planBuilder: planBuilder,
            componentBuilder: componentBuilder,
          ).fromJson(loreJson as JsonMap),
          loreInfluencer: loreInfluencer,
        ),
      _ => throw ArgumentError(json.sjson),
    };
  }

  JsonMap toJson() => {
        'ss': ss.toProto3Json() as JsonMap,
        //'u': 'will be recovery by `lore`',
        'lore': lore.base.toProto3Json() as JsonMap,
      };
}
