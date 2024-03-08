part of '../../../vast_world_share.dart';

/// See [unimplementedRender].
typedef RenderFn<T> = T Function(
  Plan spectator,
  Plan watched,
  Lore lore,
);

abstract class RenderConfigure {
  const RenderConfigure();
}

/// Data produced by [Render].
class RenderedData<T> {
  const RenderedData(
    this.spectatorId,
    this.watchedId,
    this.lore, {
    required this.data,
  });

  final String spectatorId;
  final String watchedId;
  final Lore lore;
  final T? data;
}
