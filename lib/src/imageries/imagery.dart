part of '../../vast_world.dart';

/// The axis size equals to background image size.
// ignore: must_be_immutable
class Imagery extends GeometryShape2DQuant with HasGeometry2DMix {
  Imagery(
    String pathPrefix,
    String planHid,
    String imageryHid, {
    super.uid,
    required super.axisPosition,
    required super.realWidth,
    required super.realHeight,
    required super.anchor,
    required super.axisType,
    required super.scale,
    required super.shape,
    super.wantFadeBackground = false,
  })  : assert(planHid.isNotEmpty),
        assert(imageryHid.isNotEmpty),
        super(
          pathPrefix,
          [planHid, imageryHid].listToHid,
        );

  String get hidForPlan => lastHid;
}

extension ImageryHidExt on String {
  /// Examples:
  /// ```
  /// raeria.ri
  /// ri.elf_sea
  /// ```
  bool get isCorrectImageryHid => hidToList.length == 2;
}
