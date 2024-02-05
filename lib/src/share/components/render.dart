part of '../../../vast_world_share.dart';

/// Contains a render function for transform (drawing) exposed [Plan] to
/// top [Plan].
/// Constructed by analogy [PlanListComponent].
abstract class RenderComponent<T> extends Component<RenderFn<T>> {
  RenderFn<T> get render => value;

  RenderedData<T> renderData(Plan<dynamic> spectator, Plan<dynamic> watched) =>
      RenderedData<T>(
        spectator.id,
        watched.id,
        data: render(spectator, watched),
      );
}
