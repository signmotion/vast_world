part of '../../vast_world.dart';

//typedef RenderT = Render<dynamic, RenderedData<dynamic>, RenderConfigure>;
typedef RenderT = Render<dynamic, dynamic, dynamic>;

typedef RenderBuilder = RenderT Function(
  dynamic spectator,
  dynamic watched, {
  required dynamic configure,
});

typedef RenderFn<T, C> = T? Function(
  Plan<dynamic> spectator,
  Plan<dynamic> watched,
  C configure,
);

/// Render the [watched] for [spectator].
//abstract class Render<T, D extends RenderedData<T>, C extends RenderConfigure> {
class Render<T, D, C> {
  Render(
    this.spectator,
    this.watched, {
    required this.render,
    required this.defaults,
    required this.configure,
  });

  final Plan<dynamic> spectator;
  final Plan<dynamic> watched;

  @protected
  final RenderFn<T, C> render;

  /// Rendered [watched] into [spectator].
  D get renderedData => RenderedData(
        spectator.id,
        watched.id,
        data: render(spectator, watched, configure) ?? defaults,
      ) as D;

  @protected
  final T defaults;

  D get defaultData => RenderedData(
        spectator.id,
        watched.id,
        data: defaults,
      ) as D;

  final C configure;

  C get cfg => configure;
}

abstract class RenderConfigure {
  const RenderConfigure();
}
