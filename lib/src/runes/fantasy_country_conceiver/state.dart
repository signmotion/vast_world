part of '../fantasy_country_conceiver.dart';

class State extends AState<ContentBase> {
  const State({required super.ss});

  @override
  State copyWith({ContentBase? ss}) => State(ss: ss ?? this.ss);
}
