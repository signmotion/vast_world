part of '../../../vast_world_share.dart';

typedef Geometry2DT = ({
  Vector2? axisSize,
  Unit2? realSize,
  UnitType? unitType,
  num? scale,
  Shape2D? shape,
});

class Geometry2DComponent extends Component<Geometry2DT> {
  @override
  void initv(Geometry2DT v) {
    shape = v.shape ?? const InfinityShape();
    final axisSize = v.axisSize ?? shape.size;
    final scale = v.scale ?? 0;
    final unitType = v.unitType ?? UnitType.undefined;
    realSize = v.realSize ??
        (
          Unit(axisSize.x * scale, unitType),
          Unit(axisSize.y * scale, unitType),
        );
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
        axisSize: Vector2.all(0),
        realSize: (Unit.undefined, Unit.undefined),
        unitType: UnitType.undefined,
        scale: 0,
        shape: const InfinityShape(),
      );

  static const defaultAnchor1D = Anchor1D.start;
  static const defaultAnchor2D = Anchor2D.topLeft;
  static const defaultAxisType = AxisType.loop;

  Vector2 get axisSize =>
      Vector2(realWidth.value / scale, realHeight.value / scale);
  int get axisWidth => axisSize.x.round();
  int get axisHeight => axisSize.y.round();
  List<int> get axisAbsSizes => [axisWidth, axisHeight];

  /// Exludes an upper value.
  /// Depends of [anchor] but today equals to [axisAbsSizes] always.
  List<int> get axisUppers => axisAbsSizes;

  /// Includes a lower value.
  /// Depends of [anchor] but today equals to [0, 0] always.
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

  @override
  JsonMap get valueAsJson => throw UnimplementedError();

  @override
  Geometry2DT jsonAsValue(JsonMap json) => throw UnimplementedError();
}
