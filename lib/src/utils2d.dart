import 'dart:math';

/// Returns the radiuses of the ellipsoide according to the size.
(int, int) size2DToCircleRadius(
  int width,
  int height, {
  num scale = 1.0,
}) =>
    (
      size1DToCircleRadius(width, scale: scale),
      size1DToCircleRadius(height, scale: scale),
    );

/// Returns the radius of the circle according to the length.
int size1DToCircleRadius(
  int circumference, {
  num scale = 1.0,
}) {
  assert(circumference > 0);

  return (circumference / pi / 2 * scale).floor();
}
