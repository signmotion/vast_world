part of '../../vast_world.dart';

class PolygonShape extends Shape2D {
  const PolygonShape(this.polygon);

  factory PolygonShape.fromList(Iterable<Vector2> vertices) => PolygonShape(
        amath.Polygon(
          vertices: vertices.map((v) => amath.Point(v.x, v.y)).toList(),
        ),
      );

  final amath.Polygon polygon;

  @override
  Rect get boundingBox {
    final bb = polygon.boundingBox();
    // result:
    //   0: minX, minY
    //   1: maxX, minY
    //   2: maxX, maxY
    //   3: minX, maxY

    return Rect.fromLTRB(
      bb[0].x.toDouble(),
      bb[0].y.toDouble(),
      bb[2].x.toDouble(),
      bb[2].y.toDouble(),
    );
  }

  @override
  bool inside(num x, num y) => polygon.isPointInsidePolygon(amath.Point(x, y));

  @override
  List<Object?> get props => [
        ...super.props,
        polygon.vertices?.map((v) => (v.x, v.y)),
      ];
}
