part of '../vast_world.dart';

/// Returns the radiuses of the ellipsoide according to the size.
(double, double) size2DToCircleRadius(
  int width,
  int height, {
  num scale = 1.0,
}) =>
    (
      size1DToCircleRadius(width, scale: scale),
      size1DToCircleRadius(height, scale: scale),
    );

/// Returns the radius of the circle according to the length.
double size1DToCircleRadius(
  int circumference, {
  num scale = 1.0,
}) {
  assert(circumference > 0);

  return circumference / pi / 2 * scale;
}
