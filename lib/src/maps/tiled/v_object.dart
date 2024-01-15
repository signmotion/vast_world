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

class VObjectTile extends VObject {
  VObjectTile({
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

  factory VObjectTile.fromParentAndImagery({
    required ParentChildCalc2DMix parent,
    required int id,
    required int gid,
    required DEPRECATED_Imagery imagery,
  }) {
    final (isx, isy) = parent.axisSizeChildInParent(imagery);

    return VObjectTile(
      id: id,
      gid: gid,
      name: imagery.hidForPlan,
      x: imagery.x,
      y: imagery.y,
      width: isx,
      height: isy,
    );
  }
}
