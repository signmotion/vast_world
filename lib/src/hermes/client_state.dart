part of '../../vast_world_hermes.dart';

class ClientState extends AState<ClientStateBase> {
  const ClientState({
    required super.ss,
    required this.u,
    required this.lore,
  });

  final Universe u;

  final Lore lore;

  @override
  ClientState copyWith({
    ClientStateBase? ss,
    Universe? u,
    Lore? lore,
  }) =>
      ClientState(
        ss: ss ?? this.ss,
        u: u ?? this.u,
        lore: lore ?? this.lore,
      );

  @override
  List<Object?> get props => [...super.props, lore, u];

  /// Return a new state with new [Universe].
  static ClientState fromJson(JsonMap json) {
    final newUniverse = Universe();

    return switch (json) {
      {
        'ss': Map<String?, Object?> ss,
        'lore': Map<String?, Object?> loreJson,
      } =>
        ClientState(
          ss: ClientStateBase.fromJson(ss.sjson),
          u: newUniverse,
          lore: LoreBuilder(newUniverse).fromJson(loreJson as JsonMap),
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
