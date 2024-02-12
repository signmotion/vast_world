part of '../fantasy_country_conceiver.dart';

class Live extends BaseLive<State> {
  Live(super.state);
}

Live constructLive() {
  final state = State(
    ss: ContentBase(),
  );

  return Live(state);
}
