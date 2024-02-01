part of '../../../vast_world_share.dart';

/// Impact [Act] to [T] into [Universe].
abstract class Influencer<T> {
  const Influencer();

  T processing(Universe u, T o, Act act);
}
