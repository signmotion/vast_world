import 'dart:math';

import 'package:astronomical_measurements/astronomical_measurements.dart';
import 'package:dart_helpers/dart_helpers.dart';

import 'axis_type.dart';

class Plan2D<T> {
  Plan2D({
    required int width,
    required int height,
    required Anchor2D anchor,
    required AxisType axisType,
    required this.scale,
    required this.unitType,
    required this.innerDataDefaultValue,
    required this.outerDataDefaultValue,
  })  : assert(width > 0),
        assert(height > 0),
        assert(scale > 0),
        assert(anchor == Anchor2D.topLeft, "Not implemented others."),
        anchors = [Anchor1D.left, Anchor1D.top],
        axisAbsSizes = [(width / scale).ceil(), (height / scale).ceil()],
        axisTypes = [axisType, axisType] {
    data = List.filled(axisVolume, innerDataDefaultValue);
  }

  /// Unwrap to looped surface by radius.
  factory Plan2D.planet({
    required int radius,
    required double scale,
    required UnitType unitType,
    required T innerDataDefaultValue,
    required T outerDataDefaultValue,
  }) {
    final l = (2 * pi * radius).ceil();
    return Plan2D.surface(
      width: l,
      height: l,
      anchor: Anchor2D.topLeft,
      axisType: AxisType.loop,
      scale: scale,
      unitType: unitType,
      innerDataDefaultValue: innerDataDefaultValue,
      outerDataDefaultValue: outerDataDefaultValue,
    );
  }

  factory Plan2D.surface({
    required int width,
    required int height,
    Anchor2D anchor = Anchor2D.topLeft,
    AxisType axisType = AxisType.loop,
    double scale = 1.0,
    required UnitType unitType,
    required T innerDataDefaultValue,
    required T outerDataDefaultValue,
  }) =>
      Plan2D<T>(
        width: width,
        height: height,
        anchor: anchor,
        axisType: axisType,
        scale: scale,
        unitType: unitType,
        innerDataDefaultValue: innerDataDefaultValue,
        outerDataDefaultValue: outerDataDefaultValue,
      );

  int get width => x;
  int get height => y;

  int get x => axisAbsSizes[0];
  int get y => axisAbsSizes[1];

  final List<Anchor1D> anchors;

  final List<int> axisAbsSizes;

  final List<AxisType> axisTypes;

  List<int> get axisUppers => axisAbsSizes.map((i) => i - 1).toList();
  List<int> get axisLowers => axisAbsSizes.map((i) => 0).toList();

  /// How many [unitType] contains 1 cell. A multiplicator.
  final double scale;
  final UnitType unitType;

  final T innerDataDefaultValue;
  final T outerDataDefaultValue;

  int get square => axisVolume;
  int get axisVolume => axisAbsSizes.reduce((v, e) => v * e);

  late final List<T> data;

  int index(int k, int l) => k + l * width;

  T operator []((int, int) ti) {
    final (k, l) = _clampAxisTypes(ti);

    return k > axisUppers[0] ||
            l > axisUppers[1] ||
            k < axisLowers[0] ||
            l < axisLowers[1]
        ? outerDataDefaultValue
        : data[index(k, l)];
  }

  void operator []=((int, int) ti, T v) {
    final (k, l) = _clampAxisTypes(ti);

    if (k <= axisUppers[0] &&
        l <= axisUppers[1] &&
        k >= axisLowers[0] &&
        l >= axisLowers[1]) {
      data[index(k, l)] = v;
    }
  }

  (int, int) _clampAxisTypes((int, int) ti) => (
        _clampAxisType(ti.$1, 0),
        _clampAxisType(ti.$2, 1),
      );

  int _clampAxisType(int vi, int axisIndex) {
    final type = axisTypes[axisIndex];
    if (type == AxisType.borderless) {
      return vi;
    } else if (type == AxisType.borderstrict) {
      return vi.clamp(axisLowers[axisIndex], axisUppers[axisIndex]);
    } else if (type == AxisType.loop) {
      return vi %= axisAbsSizes[axisIndex];
    }

    throw Exception('Unsupported `$type`.');
  }
}
