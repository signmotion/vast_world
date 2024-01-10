part of '../../vast_world.dart';

mixin HasGeometryMix on Object {
  static const defaultAnchor1D = Anchor1D.start;
  static const defaultAnchor2D = Anchor2D.topLeft;
  static const defaultAxisType = AxisType.loop;

  /// Axis position... somethere.
  late final (int, int) axisPosition;
  int get x => axisPosition.$1;
  int get y => axisPosition.$2;

  /// Absolute width in [Unit].
  late final Unit realWidth;

  /// Absolute height in [Unit].
  late final Unit realHeight;

  List<Unit> get realAbsSizes => [realWidth, realHeight];

  /// The axis size equals to background image size.
  late final int axisWidth;
  late final int axisHeight;

  List<int> get axisAbsSizes => [axisWidth, axisHeight];

  Anchor2D anchor = defaultAnchor2D;

  List<Anchor1D> get anchors => [defaultAnchor1D, defaultAnchor1D];

  AxisType axisType = defaultAxisType;

  List<AxisType> get axisTypes => [axisType, axisType];

  /// How many [UnitType] contains 1 cell.
  /// Calculating by width.
  double get scale => realWidth.value / axisWidth;

  /// Includes an upper value.
  List<int> get axisUppers => axisAbsSizes.map((i) => i - 1).toList();

  /// Includes a lower value.
  List<int> get axisLowers => axisAbsSizes.map((i) => 0).toList();

  int get axisSquare => axisWidth * axisHeight;
  int get axisVolume => axisAbsSizes.reduce((v, e) => v * e);

  Unit get realSquare => realWidth * realHeight;
  Unit get realVolume => realAbsSizes.reduce((v, e) => v * e);
}
