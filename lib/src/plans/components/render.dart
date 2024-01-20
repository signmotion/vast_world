part of '../../../vast_world.dart';

/// Contains a render function for transform (drawing) exposed [Plan] to
/// influential [Plan].
/// Constructed by analogy [PlanListComponent].
/// [R] extends [RenderFn<T>].
abstract class RenderComponent<T> extends VComponent<RenderFn<T>> {
  RenderFn<T> get render => value;

  RenderedData<T> renderData(Plan<dynamic> spectator, Plan<dynamic> watched) =>
      RenderedData<T>(
        spectator.id,
        watched.id,
        data: render(spectator, watched),
      );
}
