import 'dart:io';
import 'dart:math';

import 'package:astronomical_measurements/astronomical_measurements.dart';
import 'package:dart_helpers/dart_helpers.dart';
import 'package:image/image.dart';
import 'package:path/path.dart' as p;

import 'axis_type.dart';
import 'background.dart';
import 'imagery.dart';
import 'source.dart';

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

  /// Includes an upper value.
  List<int> get axisUppers => axisAbsSizes.map((i) => i - 1).toList();

  /// Includes a lower value.
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

  Source? source;
  Background? background;
  List<Imagery> imageries = [];

  Plan2D<T> operator +(dynamic o) {
    if (o is Source) {
      setSource(o);
    } else if (o is Background) {
      setBackground(o);
    } else if (o is Imagery) {
      addImagery(o);
    } else {
      throw Exception('Unsupported class `$o`.');
    }

    return this;
  }

  void setSource(Source v) => source = v;

  void setBackground(Background v) {
    final (:path, :image) = loadImage(v.path);
    this.background = Background(path, image);
  }

  Future<void> addImagery(Imagery v) async {
    final vpath = p.join(v.path, Background.defaultFilename);
    final (:path, :image) = loadImage(vpath);
    final scaleByWidth = v.width.value / image.width;
    final height = v.height ?? Unit.kilometre(image.height * scaleByWidth);

    final background = v.background ?? Background(path, image);

    final imagery = Imagery(
      p.join(source!.path, v.path),
      position: v.position,
      width: v.width,
      height: height,
      background: background,
    );
    this.imageries.add(imagery);
  }

  ({String path, Image image}) loadImage(String vpath) {
    final path = p.join(source!.path, vpath);
    final file = File(path);
    final bytes = file.readAsBytesSync();
    // use filename extension to determine the decoder
    final image = decodeNamedImage(path, bytes)!;

    return (path: path, image: image);
  }
}
