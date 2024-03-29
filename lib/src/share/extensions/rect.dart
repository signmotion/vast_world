/// Source: Flame
part of '../../../vast_world_share.dart';

extension RectExtension on Rect {
  /// Creates an [Offset] from this [Rect]
  Offset toOffset() => Offset(width, height);

  /// Creates a [Vector2] starting in top left and going to (width, height).
  Vector2 toVector2() => Vector2(width, height);

  /// Converts this [Rect] into a [math.Rectangle].
  math.Rectangle toMathRectangle() => math.Rectangle(left, top, width, height);

  /// Whether this [Rect] contains a [Vector2] point or not
  bool containsPoint(Vector2 point) => contains(point.toOffset());

  /// Whether the segment formed by [pointA] and [pointB] intersects this [Rect]
  bool intersectsSegment(Vector2 pointA, Vector2 pointB) {
    return math.min(pointA.x, pointB.x) <= right &&
        math.min(pointA.y, pointB.y) <= bottom &&
        math.max(pointA.x, pointB.x) >= left &&
        math.max(pointA.y, pointB.y) >= top;
  }

  List<Vector2> toVertices() {
    return [
      topLeft.toVector2(),
      topRight.toVector2(),
      bottomRight.toVector2(),
      bottomLeft.toVector2(),
    ];
  }

  /// Transform Rect using the transformation defined by [matrix].
  ///
  /// **Note:** Rotation matrices will increase the size of the [Rect] but they
  /// will not rotate it as [Rect] does not have any rotational values.
  ///
  /// **Note:** Only non-negative scale transforms are allowed, if a negative
  /// scale is applied it will return a zero-based [Rect].
  ///
  /// **Note:** The transformation will always happen from the center of the
  /// `Rect`.
  Rect transform(Matrix4 matrix) {
    // For performance reasons we are using the same logic from
    // `Matrix4.transform2` but without the extra overhead of creating vectors.
    return Rect.fromLTRB(
      (topLeft.dx * matrix.entry(1, 1)) +
          (topLeft.dy * matrix.entry(2, 1)) +
          matrix.entry(4, 1),
      (topLeft.dx * matrix.entry(1, 2)) +
          (topLeft.dy * matrix.entry(2, 2)) +
          matrix.entry(4, 2),
      (bottomRight.dx * matrix.entry(1, 1)) +
          (bottomRight.dy * matrix.entry(2, 1)) +
          matrix.entry(4, 1),
      (bottomRight.dx * matrix.entry(1, 2)) +
          (bottomRight.dy * matrix.entry(2, 2)) +
          matrix.entry(4, 2),
    );
  }

  /// Generates a random point within the bounds of this [Rect].
  Vector2 randomPoint([math.Random? random]) {
    final randomGenerator = random ?? randomFallback;
    return Vector2(
      left + randomGenerator.nextDouble() * width,
      top + randomGenerator.nextDouble() * height,
    );
  }

  /// Creates a [Rect] that represents the bounds of the list [pts].
  static Rect getBounds(List<Vector2> pts) {
    final xPoints = pts.map((e) => e.x);
    final yPoints = pts.map((e) => e.y);

    final minX = xPoints.reduce(math.min);
    final maxX = xPoints.reduce(math.max);
    final minY = yPoints.reduce(math.min);
    final maxY = yPoints.reduce(math.max);
    return Rect.fromPoints(Offset(minX, minY), Offset(maxX, maxY));
  }

  /// Constructs a [Rect] with a [width] and [height] around the [center] point.
  static Rect fromCenter({
    required Vector2 center,
    required double width,
    required double height,
  }) {
    return Rect.fromLTRB(
      center.x - width / 2,
      center.y - height / 2,
      center.x + width / 2,
      center.y + height / 2,
    );
  }
}
