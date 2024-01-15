part of '../../vast_world.dart';

/// This shape includes all inside.
class InfinityShape extends Shape2D {
  const InfinityShape();

  @override
  Rect get boundingBox => const Rect.fromLTRB(
        -double.infinity,
        -double.infinity,
        double.infinity,
        double.infinity,
      );

  @override
  bool inside(num x, num y) => true;
}
