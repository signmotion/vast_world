part of '../../vast_world.dart';

typedef RenderFn<R> = R Function(
  Plan<dynamic> spectator,
  Plan<dynamic> watched,
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
