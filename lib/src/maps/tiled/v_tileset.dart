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
    required Plan<dynamic> imagery,
    required int firstGid,
    int? tileWidth,
    int? tileHeight,
  }) =>
      VImagery(
        name: imagery.hid,
        tileWidth: tileWidth,
        tileHeight: tileHeight,
        image: tileWidth == null
            ? null
            : VBackgroundImage(
                pathPrefix: planId,
                width: tileWidth,
                height: tileHeight,
              ),
        firstGid: firstGid,
      );
}
