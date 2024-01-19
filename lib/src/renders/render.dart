part of '../../vast_world.dart';

typedef RenderFn<R> = R Function(
  Plan<dynamic> spectator,
  Plan<dynamic> watched,
);

abstract class RenderConfigure {
  const RenderConfigure();
}
