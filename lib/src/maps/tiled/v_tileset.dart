part of '../../../vast_world.dart';

class VTileset extends Tileset {
  VTileset({
    required super.name,
    required super.tileWidth,
    required super.tileHeight,
    required super.image,
    required super.tileCount,
    required super.firstGid,
  });
}

class VImagery extends VTileset {
  VImagery({
    required super.name,
    required super.tileWidth,
    required super.tileHeight,
    required super.image,
    required super.firstGid,
  }) : super(tileCount: 1);

  factory VImagery.fromImagery({
    required String planId,
    required Imagery imagery,
    required int firstGid,
  }) =>
      VImagery(
        name: imagery.hidForPlan,
        tileWidth: imagery.axisWidth,
        tileHeight: imagery.axisHeight,
        image: VBackgroundImage(
          pathPrefix: imagery.hidForPlan,
          width: imagery.axisWidth,
          height: imagery.axisHeight,
        ),
        firstGid: firstGid,
      );
}
