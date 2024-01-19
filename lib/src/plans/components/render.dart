part of '../../../vast_world.dart';

/// Contains a render function for transform (drawing) exposed [Plan] to
/// influential [Plan].
class RenderComponent<R> extends VComponent<RenderFn<R>?> {
  @override
  RenderFn<R>? get empty => null;

  RenderFn<R>? get render => value;

  RenderedData<R> renderData(
    String spectatorId,
    String watchedId, {
    required R data,
  }) =>
      RenderedData<R>(spectatorId, watchedId, data: data);
}
