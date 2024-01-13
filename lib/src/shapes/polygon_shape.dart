part of '../../vast_world.dart';

class PolygonShape extends Shape2D {
  const PolygonShape(this.polygon);

  factory PolygonShape.fromList(Iterable<(num, num)> vertices) => PolygonShape(
        amath.Polygon(
          vertices: vertices.map((v) => amath.Point(v.$1, v.$2)).toList(),
        ),
      );

  final amath.Polygon polygon;

  @override
  bool inside(num x, num y) => polygon.isPointInsidePolygon(amath.Point(x, y));

  @override
  List<Object?> get props => [
        ...super.props,
        polygon.vertices?.map((v) => (v.x, v.y)).toList(),
      ];
}
