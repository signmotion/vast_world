part of '../../../vast_world_share.dart';

/// Impact [Act] to [T] into [Universe].
abstract class Influencer<T> {
  const Influencer({
    required this.u,
    required this.planBuilder,
    required this.componentBuilder,
  });

  final TPlanBuilder planBuilder;
  final TComponentBuilder componentBuilder;

  final Universe u;

  T processingOnClient(T o, Act act);
  T processingOnServer(T o, Act act);
}
