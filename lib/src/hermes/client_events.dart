part of '../../../vast_world_hermes.dart';

abstract class AClientEvent extends BaseEquatable {
  const AClientEvent();
}

class InitializingClientEvent extends AClientEvent {
  const InitializingClientEvent();
}

class InitializingMaiaClientEvent extends AClientEvent {
  const InitializingMaiaClientEvent();
}

class RegisteringClientEvent extends AClientEvent {
  const RegisteringClientEvent();
}

class ClaimingSessionClientEvent extends AClientEvent {
  const ClaimingSessionClientEvent();
}

class ApprovingSessionClientEvent extends AClientEvent {
  const ApprovingSessionClientEvent();
}

class GettingAboutServerClientEvent extends AClientEvent {
  const GettingAboutServerClientEvent();
}

class OpeningSyncStreamsClientEvent extends AClientEvent {
  const OpeningSyncStreamsClientEvent();
}

class WaitingInputClientEvent extends AClientEvent {
  const WaitingInputClientEvent();
}

class SendingToServerActClientEvent extends AClientEvent {
  const SendingToServerActClientEvent({required this.act});

  final Act act;

  @override
  List<Object?> get props => [...super.props, act];
}

class ProcessingActClientEvent extends AClientEvent {
  const ProcessingActClientEvent({
    required this.act,
    required this.answer,
  });

  final Act act;
  final maia.ServerAnswerTypeEnum answer;

  @override
  List<Object?> get props => [...super.props, act, answer];
}
