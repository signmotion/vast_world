part of '../../../vast_world_share.dart';

/// Impact [Act] to [T] into [Universe].
abstract class Influencer<T> {
  const Influencer({
    required this.u,
    required this.planBuilder,
    required this.componentBuilder,
  });

  final T2Builder<NativePlanBuilder, Universe, TBuilder<NativeComponentBuilder>>
      planBuilder;
  final TBuilder<NativeComponentBuilder> componentBuilder;

  final Universe u;

  T processing(T o, Act act);
}
