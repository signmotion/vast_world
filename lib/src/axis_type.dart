part of '../vast_world.dart';

enum AxisType {
  undefined,

  /// Grant any coordinate.
  borderless,

  /// Crop the coordinate to maximum and minimum border sizes.
  borderstrict,

  /// Looped coordinate, circled world.
  loop,
}
