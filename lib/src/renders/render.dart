part of '../../vast_world.dart';

//typedef RenderT = Render<dynamic, RenderedData<dynamic>, RenderConfigure>;
typedef RenderT = Render<dynamic, dynamic, dynamic>;

typedef RenderBuilder = RenderT Function(
  Plan<dynamic> spectator,
  Plan<dynamic> watched, {
  ImageRenderConfigure configure,
});

/// Render the [watched] for [spectator].
//abstract class Render<T, D extends RenderedData<T>, C extends RenderConfigure> {
abstract class Render<T, D, C> {
  Render(
    this.spectator,
    this.watched, {
    required this.configure,
  });

  final Plan<dynamic> spectator;
  final Plan<dynamic> watched;

  /// Rendered [watched] into [spectator].
  /// Always returns something.
  D get rendered;

  final C configure;

  C get cfg => configure;
}

abstract class RenderConfigure {
  const RenderConfigure();
}
