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

class ConstructingAndFetchingPlanClientEvent extends AClientEvent {
  const ConstructingAndFetchingPlanClientEvent({required this.plan});

  final Plan<dynamic> plan;

  @override
  List<Object?> get props => [...super.props, plan];
}

class ConstructingPlanClientEvent extends AClientEvent {
  const ConstructingPlanClientEvent({required this.plan});

  final Plan<dynamic> plan;

  @override
  List<Object?> get props => [...super.props, plan];
}

class ConstructingWhenAbsentAndFetchingPlanClientEvent extends AClientEvent {
  const ConstructingWhenAbsentAndFetchingPlanClientEvent({required this.plan});

  final Plan<dynamic> plan;

  @override
  List<Object?> get props => [...super.props, plan];
}

class ConstructingPlanWhenAbsentClientEvent extends AClientEvent {
  const ConstructingPlanWhenAbsentClientEvent({required this.plan});

  final Plan<dynamic> plan;

  @override
  List<Object?> get props => [...super.props, plan];
}

class SettingCurrentPlanIdClientEvent extends AClientEvent {
  const SettingCurrentPlanIdClientEvent({required this.planId});

  final String planId;

  @override
  List<Object?> get props => [...super.props, planId];
}

/// See [ConstructingPlanClientEvent], [ConstructingAndFetchingPlanClientEvent].
class FetchingPlanClientEvent extends AClientEvent {
  const FetchingPlanClientEvent({required this.planId});

  final String planId;

  @override
  List<Object?> get props => [...super.props, planId];
}

class FetchingPlansClientEvent extends AClientEvent {
  const FetchingPlansClientEvent();
}

class SuccessInitClientEvent extends AClientEvent {
  const SuccessInitClientEvent();
}

class FailureInitClientEvent extends AClientEvent {
  const FailureInitClientEvent();
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
  final maia.ServerAnswer answer;

  @override
  List<Object?> get props => [...super.props, act, answer];
}
