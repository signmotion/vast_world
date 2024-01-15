part of '../../vast_world.dart';

/// Returns the radiuses of the ellipsoide according to the size.
Vector2 size2DToCircleRadius(
  num width,
  num height, {
  num scale = 1.0,
}) =>
    Vector2(
      size1DToCircleRadius(width, scale: scale),
      size1DToCircleRadius(height, scale: scale),
    );

/// Returns the radius of the circle according to the length.
double size1DToCircleRadius(
  num circumference, {
  num scale = 1.0,
}) {
  assert(circumference > 0);

  return circumference / math.pi / 2 * scale;
}

Vector2 axisSizeFromRealSize(Unit2 realSize, num scale) => Vector2(
      axisLenghtFromRealLenght(realSize.$1.value, scale),
      axisLenghtFromRealLenght(realSize.$2.value, scale),
    );

double axisLenghtFromRealLenght(num realLenght, num scale) =>
    realLenght / scale;
