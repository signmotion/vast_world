part of '../../../vast_world_share.dart';

/// Contains a render function for transform (drawing) exposed [Plan] to
/// top [Plan].
/// Constructed by analogy [PlanListComponent].
/// Use [unimplementedRender] to stub the Client only render on the Server side.
abstract class RenderComponent<T> extends Component<RenderFn<T>> {
  @override
  set value(RenderFn<T>? v) =>
      throw UnsupportedError('Just override [value] for return function.');

  RenderFn<T> get render => value;

  RenderedData<T> renderData(Plan<dynamic> spectator, Plan<dynamic> watched) =>
      RenderedData<T>(
        spectator.id,
        watched.id,
        data: render(spectator, watched),
      );
}
