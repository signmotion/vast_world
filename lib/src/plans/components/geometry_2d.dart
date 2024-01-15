part of '../../../vast_world.dart';

typedef Geometry2DT = ({
  Vector2? axisPosition,
  Vector2? axisSize,
  Unit2? realSize,
  num? scale,
  Shape2D? shape,
});

class Geometry2DComponent extends VComponent<Geometry2DT> {
  @override
  void initv(Geometry2DT v) {
    shape = v.shape ?? const InfinityShape();
    axisPosition = v.axisPosition ?? Vector2.all(0);
    axisSize = v.axisSize ?? shape.size;
    final sc = v.scale ?? 0;
    realSize = v.realSize ?? (realSize.$1 * sc, realSize.$2 * sc);
  }

  @override
  void check() {
    ae(axisSize.x > 0 && axisSize.y > 0,
        '`axisSize` should be defined or calculated by `shape`.');
    ae(realSize.$1 > 0 && realSize.$2 > 0,
        '`realSize` should be defined or calculated by `shape` and `scale`.');
  }

  @override
  Geometry2DT get empty => (
        axisPosition: Vector2.all(0),
        axisSize: Vector2.all(0),
        realSize: (Unit.undefined, Unit.undefined),
        scale: 0,
        shape: const InfinityShape(),
      );

  static const defaultAnchor1D = Anchor1D.start;
  static const defaultAnchor2D = Anchor2D.topLeft;
  static const defaultAxisType = AxisType.loop;

  /// Axis position... somethere.
  late final Vector2 axisPosition;
  double get x => axisPosition.x;
  double get y => axisPosition.y;

  /// The axis size equals to background image size.
  late final Vector2 axisSize;
  int get axisWidth => axisSize.x.round();
  int get axisHeight => axisSize.y.round();
  List<int> get axisAbsSizes => [axisWidth, axisHeight];

  /// Exludes an upper value.
  List<int> get axisUppers => axisAbsSizes;

  /// Includes a lower value.
  List<int> get axisLowers => List<int>.filled(axisAbsSizes.length, 0);

  AxisType axisType = defaultAxisType;
  List<AxisType> get axisTypes => [axisType, axisType];

  Anchor2D anchor = defaultAnchor2D;
  List<Anchor1D> get anchors => [defaultAnchor1D, defaultAnchor1D];

  int get axisSquare => axisWidth * axisHeight;

  late final Unit2 realSize;
  Unit get realWidth => realSize.$1;
  Unit get realHeight => realSize.$2;
  List<Unit> get realAbsSizes => [realWidth, realHeight];

  /// How many [UnitType] contains 1 axis point.
  /// Calculating by width.
  double get scale => realWidth.value / axisWidth;

  Unit get realSquare => realWidth * realHeight;

  late final Shape2D shape;
}
