part of '../../../vast_world_share.dart';

/// See [unimplementedRender].
typedef RenderFn<T> = T Function(
  Plan<Plan<dynamic>> spectator,
  Plan<Plan<dynamic>> watched,
);

abstract class RenderConfigure {
  const RenderConfigure();
}

/// Data produced by [Render].
class RenderedData<T> {
  const RenderedData(
    this.spectatorId,
    this.watchedId, {
    required this.data,
  });

  final String spectatorId;
  final String watchedId;
  final T? data;
}
