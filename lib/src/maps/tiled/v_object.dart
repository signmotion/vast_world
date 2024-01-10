part of '../../../vast_world.dart';

class VObject extends TiledObject {
  VObject({
    required super.id,
    required super.gid,
    required super.name,
    required super.x,
    required super.y,
    required super.width,
    required super.height,
    super.tile = false,
  });
}

class VTile extends VObject {
  VTile({
    required super.id,
    required super.gid,
    required super.name,
    required num x,
    required num y,
    required num width,
    required num height,
  }) : super(
          x: x.toDouble(),
          y: y.toDouble(),
          width: width.toDouble(),
          height: height.toDouble(),
          tile: true,
        );

  factory VTile.fromImagery({
    required int id,
    required int gid,
    required Imagery imagery,
  }) =>
      VTile(
        id: id,
        gid: gid,
        name: imagery.id,
        x: imagery.positionX,
        y: imagery.positionY,
        width: imagery.axisWidth,
        height: imagery.axisHeight,
      );
}
