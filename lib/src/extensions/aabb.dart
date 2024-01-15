/// Source: Flame
part of '../../vast_world.dart';

extension Aabb2Extension on Aabb2 {
  /// Creates a [Rect] starting in [min] and going the [max]
  Rect toRect() => Rect.fromLTRB(min.x, min.y, max.x, max.y);
}
