part of '../../../vast_world_share.dart';

/// Impact [Act] to [T].
abstract class Influencer<T> {
  const Influencer();

  void processing(T o, Act act);
}
