part of '../../../vast_world_share.dart';

abstract class Shape2D extends Shape {
  const Shape2D();

  Vector2 get size => aabb.max - aabb.min;
  num get width => size.x - size.x;
  num get height => size.y - size.y;

  Aabb2 get aabb => Aabb2.minMax(min, max);

  /// Order of vertecies considers to [RectExtension.toVertices()] from Flame:
  /// ```
  /// List<Vector2> toVertices() {
  ///   return [
  ///     topLeft,
  ///     topRight,
  ///     bottomRight,
  ///     bottomLeft,
  ///   ];
  /// }
  /// ```
  Rect get boundingBox;
  Vector2 get topLeft => boundingBox.topLeft.toVector2();
  Vector2 get topRight => boundingBox.topRight.toVector2();
  Vector2 get bottomRight => boundingBox.bottomRight.toVector2();
  Vector2 get bottomLeft => boundingBox.bottomLeft.toVector2();

  /// Maximim coordinates.
  Vector2 get max => topRight;

  /// Minimum coordinates.
  Vector2 get min => bottomLeft;

  Vector2 get center => aabb.center;

  bool inside(num x, num y);

  bool outside(num x, num y) => !inside(x, y);

  @override
  List<Object?> get props => [...super.props, center, width, height];
}
