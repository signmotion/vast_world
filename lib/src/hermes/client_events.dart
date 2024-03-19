part of '../../../vast_world_hermes.dart';

abstract class AClientEvent extends dh.BaseEquatable {
  const AClientEvent();

  @override
  String toString() => '🥏 $runtimeType $props'.replaceFirst('Event', '');
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

  final Plan plan;

  @override
  List<Object?> get props => [...super.props, plan];
}

class ConstructingPlanClientEvent extends AClientEvent {
  const ConstructingPlanClientEvent({required this.plan});

  final Plan plan;

  @override
  List<Object?> get props => [...super.props, plan];
}

class ConstructingWhenAbsentAndFetchingPlanClientEvent extends AClientEvent {
  const ConstructingWhenAbsentAndFetchingPlanClientEvent({
    required this.fromPlanId,
    required this.plan,
  });

  final String fromPlanId;
  final Plan plan;

  @override
  List<Object?> get props => [...super.props, fromPlanId, plan];
}

class ConstructingPlanWhenAbsentClientEvent extends AClientEvent {
  const ConstructingPlanWhenAbsentClientEvent({
    required this.fromPlanId,
    required this.plan,
  });

  final String fromPlanId;
  final Plan plan;

  @override
  List<Object?> get props => [...super.props, fromPlanId, plan];
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
  const WaitingInputClientEvent({required this.from});

  final String from;

  @override
  List<Object?> get props => [...super.props, from];
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

class SettingComponentsClientEvent<C extends Component<T>, T>
    extends AClientEvent {
  const SettingComponentsClientEvent({
    required this.planId,
    required this.initializedComponents,
  });

  final String planId;
  final List<C> initializedComponents;

  @override
  List<Object?> get props => [...super.props, planId, initializedComponents];
}
