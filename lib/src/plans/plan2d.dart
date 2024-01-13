part of '../../vast_world.dart';

// ignore: must_be_immutable
class Plan2D<T> extends GeometryShape2DQuant with ParentChildCalc2DMix {
  Plan2D(
    super.pathPrefix,
    super.hid, {
    super.uid,
    required super.realWidth,
    required super.realHeight,
    required super.anchor,
    required super.axisType,
    required super.scale,
    required super.shape,
    super.wantFadeBackground = false,
    List<Imagery>? imageries,
    required this.innerDataDefaultValue,
    required this.outerDataDefaultValue,
  }) : super(axisPosition: (0, 0)) {
    data = List.filled(axisVolume, innerDataDefaultValue);
    this.imageries = imageries ?? <Imagery>[];
  }

  /// Unwrap to looped surface by radius.
  factory Plan2D.planet(
    String pathPrefix,
    String hid, {
    Unit? realRadius,
    Unit? realRadiusX,
    Unit? realRadiusY,
    required num scale,
    bool wantFadeBackground = false,
    required T innerDataDefaultValue,
    required T outerDataDefaultValue,
  }) {
    assert(realRadius != null || (realRadiusX != null && realRadiusY != null),
        'Should be defined [realRadius] or both [realRadiusX] and [realRadiusY].');

    final rx = realRadiusX ?? realRadius;
    final ry = realRadiusY ?? realRadius;
    assert(rx != null, ry != null);

    return Plan2D.surface(
      pathPrefix,
      hid,
      realWidth: rx! * 2 * pi,
      realHeight: ry! * 2 * pi,
      anchor: HasGeometry2DMix.defaultAnchor2D,
      axisType: AxisType.loop,
      scale: scale,
      wantFadeBackground: wantFadeBackground,
      innerDataDefaultValue: innerDataDefaultValue,
      outerDataDefaultValue: outerDataDefaultValue,
    );
  }

  factory Plan2D.surface(
    String pathPrefix,
    String hid, {
    required Unit realWidth,
    required Unit realHeight,
    Anchor2D anchor = HasGeometry2DMix.defaultAnchor2D,
    AxisType axisType = HasGeometry2DMix.defaultAxisType,
    num scale = 1.0,
    bool wantFadeBackground = false,
    required T innerDataDefaultValue,
    required T outerDataDefaultValue,
  }) =>
      Plan2D<T>(
        pathPrefix,
        hid,
        realWidth: realWidth,
        realHeight: realHeight,
        anchor: anchor,
        axisType: axisType,
        scale: scale,
        shape: const EmptyShape(),
        wantFadeBackground: wantFadeBackground,
        innerDataDefaultValue: innerDataDefaultValue,
        outerDataDefaultValue: outerDataDefaultValue,
      );

  factory Plan2D.imageryToPlan(
    Plan2D<T> parentPlan,
    Imagery imagery, {
    Anchor2D? anchor,
    AxisType? axisType,
    bool wantFadeBackground = false,
    T? innerDataDefaultValue,
    T? outerDataDefaultValue,
  }) {
    if (imagery is! PictureImagery) {
      throw UnimplementedError('Not implemented `${imagery.runtimeType}`.');
    }

    final path = ph.joinAll(
        imagery.npath.split(CanWorkWithFile.pathSeparator)..removeLast());

    return Plan2D<T>(
      path,
      imagery.hidForPlan,
      uid: imagery.uid,
      realWidth: imagery.realWidth,
      realHeight: imagery.realHeight,
      anchor: anchor ?? HasGeometry2DMix.defaultAnchor2D,
      axisType: axisType ?? HasGeometry2DMix.defaultAxisType,
      scale: imagery.scale,
      shape: imagery.shape,
      wantFadeBackground: wantFadeBackground,
      innerDataDefaultValue:
          innerDataDefaultValue ?? parentPlan.innerDataDefaultValue,
      outerDataDefaultValue:
          outerDataDefaultValue ?? parentPlan.outerDataDefaultValue,
    );
  }

  final T innerDataDefaultValue;
  final T outerDataDefaultValue;

  late final List<T> data;

  PictureImagery toPictureImagery({
    required String parentPlanHid,
    required (int, int) axisPositionInParentPlan,
  }) =>
      PictureImagery.fromImage(
        npathWithoutHid,
        parentPlanHid,
        lastHid,
        axisPosition: axisPositionInParentPlan,
        // the height will be calculated in proportion to the image size
        realWidth: realWidth,
        anchor: anchor,
        axisType: axisType,
        shape: shape,
        wantFadeBackground: wantFadeBackground,
      );

  T operator []((int, int) ti) {
    final (k, l) = _clampAxisTypes(ti);

    return outside(k, l) ? outerDataDefaultValue : data[index(k, l)];
  }

  void operator []=((int, int) ti, T v) {
    final (k, l) = _clampAxisTypes(ti);

    if (inside(k, l)) {
      data[index(k, l)] = v;
    }
  }

  (int, int) _clampAxisTypes((int, int) ti) => (
        _clampAxisType(ti.$1, 0),
        _clampAxisType(ti.$2, 1),
      );

  int _clampAxisType(int vi, int axisIndex) => switch (axisTypes[axisIndex]) {
        AxisType.borderless => vi,
        AxisType.borderstrict =>
          vi.clamp(axisLowers[axisIndex], axisUppers[axisIndex]),
        AxisType.loop => vi % axisAbsSizes[axisIndex],
        _ => throw Exception('Unsupported `${axisTypes[axisIndex]}`.'),
      };

  Plan2D<T> operator +(dynamic o) {
    if (o is Imagery) {
      addImagery(o);
    } else {
      throw UnimplementedError('Unsupported class `$o`.');
    }

    return this;
  }

  late final List<Imagery> imageries;

  void addImagery(Imagery v) => imageries.add(v);
}

extension PlanHidExt on String {
  /// Examples:
  /// ```
  /// raeria
  /// ri
  /// elf_sea
  /// askatria_land
  /// ```
  bool get isCorrectPlanHid => RegExp(r'^[a-z0-9_]*$').hasMatch(this);
}
