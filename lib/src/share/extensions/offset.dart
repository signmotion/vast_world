/// Source: Flame
part of '../../../vast_world_share.dart';

extension OffsetExtension on Offset {
  /// Creates an [Vector2] from the [Offset]
  Vector2 toVector2() => Vector2(dx, dy);

  /// Creates a [Rect] starting in origin and going the [Offset]
  Rect toRect() => Rect.fromLTWH(0, 0, dx, dy);
}
