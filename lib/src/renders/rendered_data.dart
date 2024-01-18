part of '../../vast_world.dart';

/// Data produced by [Render].
class RenderedData<T> {
  const RenderedData(
    this.spectatorId,
    this.watchedId, {
    required this.data,
  });

  final String spectatorId;
  final String watchedId;
  final T data;
}
