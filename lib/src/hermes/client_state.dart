part of '../../vast_world_hermes.dart';

class ClientState extends AState<ClientStateBase> {
  const ClientState({
    required super.ss,
    required this.lore,
  });

  final Lore lore;

  @override
  ClientState copyWith({
    ClientStateBase? ss,
    Lore? lore,
  }) =>
      ClientState(
        ss: ss ?? this.ss,
        lore: lore ?? this.lore,
      );
}
