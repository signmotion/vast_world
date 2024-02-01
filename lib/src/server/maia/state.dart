part of '../../../vast_world_server.dart';

class State extends AState<ServerStateBase> {
  const State({required super.ss});

  @override
  State copyWith({ServerStateBase? ss}) => State(ss: ss ?? this.ss);
}
