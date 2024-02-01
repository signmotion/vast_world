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
}
