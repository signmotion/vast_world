part of '../../vast_world_share.dart';

typedef TState = AState<GeneratedMessage>;

abstract class AState<SS extends GeneratedMessage> extends BaseState {
  const AState({required this.ss});

  final SS ss;

  AState<SS> copyWith({SS? ss});

  @override
  List<Object?> get props => [...super.props, ss];
}
