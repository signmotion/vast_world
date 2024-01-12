part of '../../vast_world.dart';

// ignore: must_be_immutable
class Plan2D<T> extends Quant with HasGeometry2DMix, ParentChildCalc2DMix {
  Plan2D(
    super.pathPrefix,
    super.hid, {
    super.uid,
    required Unit realWidth,
    required Unit realHeight,
    required Anchor2D anchor,
    required AxisType axisType,
    required num scale,
    required this.innerDataDefaultValue,
    required this.outerDataDefaultValue,
  })  : assert(realWidth > 0),
        assert(realHeight > 0),
        assert(anchor == HasGeometry2DMix.defaultAnchor2D,
            'Not implemented others.'),
        assert(scale > 0),
        assert(realWidth.type == realHeight.type,
            'Width and height should be same measurements.') {
    this.realWidth = realWidth;
    this.realHeight = realHeight;

    this.anchor = anchor;
    this.axisType = axisType;

    axisWidth = (this.realWidth / scale).ceilValue();
    axisHeight = (this.realHeight / scale).ceilValue();

    data = List.filled(axisVolume, innerDataDefaultValue);
  }

  /// Unwrap to looped surface by radius.
  factory Plan2D.planet(
    String pathPrefix,
    String hid, {
    Unit? realRadius,
    Unit? realRadiusX,
    Unit? realRadiusY,
    required num scale,
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
        innerDataDefaultValue: innerDataDefaultValue,
        outerDataDefaultValue: outerDataDefaultValue,
      );

  factory Plan2D.imageryToPlan(
    Plan2D<T> parentPlan,
    Imagery imagery, {
    Anchor2D? anchor,
    AxisType? axisType,
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
      innerDataDefaultValue:
          innerDataDefaultValue ?? parentPlan.innerDataDefaultValue,
      outerDataDefaultValue:
          outerDataDefaultValue ?? parentPlan.outerDataDefaultValue,
    );
  }

  final T innerDataDefaultValue;
  final T outerDataDefaultValue;

  late final List<T> data;

  int index(int k, int l) => k + l * axisWidth;

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

  bool inside(int k, int l) => !outside(k, l);

  bool outside(int k, int l) =>
      k > axisUppers[0] ||
      l > axisUppers[1] ||
      k < axisLowers[0] ||
      l < axisLowers[1];

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

  List<Imagery> imageries = [];

  Plan2D<T> operator +(dynamic o) {
    if (o is Imagery) {
      addImagery(o);
    } else {
      throw UnimplementedError('Unsupported class `$o`.');
    }

    return this;
  }

  void addImagery(Imagery v) => imageries.add(v);
}
