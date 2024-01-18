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
    required String imageryHid,
    required String pictureName,
    required int firstGid,
    required int tileWidth,
    required int tileHeight,
  }) =>
      VImagery(
        name: imageryHid,
        tileWidth: tileWidth,
        tileHeight: tileHeight,
        image: pictureName.isEmpty
            ? null
            : VPictureImage(
                // all plans keeps into the root level
                name: '../$imageryHid/$pictureName',
                width: tileWidth,
                height: tileHeight,
              ),
        firstGid: firstGid,
      );
}
