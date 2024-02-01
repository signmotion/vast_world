part of '../../../vast_world_share.dart';

/// Impact [Act] to [T].
abstract class Influencer<T> {
  const Influencer();

  T processing(T o, Act act);
}
