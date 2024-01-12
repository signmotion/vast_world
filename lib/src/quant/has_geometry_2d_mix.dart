part of '../../vast_world.dart';

mixin HasGeometry2DMix on Object {
  static const defaultAnchor1D = Anchor1D.start;
  static const defaultAnchor2D = Anchor2D.topLeft;
  static const defaultAxisType = AxisType.loop;

  /// Axis position... somethere.
  late final (int, int) axisPosition;
  int get x => axisPosition.$1;
  int get y => axisPosition.$2;
  List<int> get axisAbsSizes => [axisWidth, axisHeight];

  /// The axis size equals to background image size.
  late final int axisWidth;
  late final int axisHeight;

  /// Includes an upper value.
  List<int> get axisUppers => axisAbsSizes.map((i) => i - 1).toList();

  /// Includes a lower value.
  List<int> get axisLowers => axisAbsSizes.map((i) => 0).toList();

  AxisType axisType = defaultAxisType;
  List<AxisType> get axisTypes => [axisType, axisType];

  Anchor2D anchor = defaultAnchor2D;
  List<Anchor1D> get anchors => [defaultAnchor1D, defaultAnchor1D];

  int get axisSquare => axisWidth * axisHeight;
  int get axisVolume => axisAbsSizes.reduce((v, e) => v * e);

  (double, double) get realSize => (realWidth.value, realHeight.value);
  late final Unit realWidth;
  late final Unit realHeight;
  List<Unit> get realAbsSizes => [realWidth, realHeight];

  /// How many [UnitType] contains 1 cell.
  /// Calculating by width.
  double get scale => realWidth.value / axisWidth;

  Unit get realSquare => realWidth * realHeight;
  Unit get realVolume => realAbsSizes.reduce((v, e) => v * e);
}
