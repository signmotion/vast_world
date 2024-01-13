part of '../../vast_world.dart';

abstract class Shape2D extends BaseEquatable {
  const Shape2D();

  bool inside(num x, num y);

  bool outside(num x, num y) => !inside(x, y);
}
