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
    required int imageryOnPlanWidth,
    required int imageryOnPlanHeight,
    required Imagery imagery,
    required int firstGid,
  }) =>
      VImagery(
        name: imagery.id,
        tileWidth: imagery.axisWidth,
        tileHeight: imagery.axisHeight,
        image: VBackgroundImage(
          pathPrefix: imagery.id,
          width: imageryOnPlanWidth,
          height: imageryOnPlanHeight,
        ),
        firstGid: firstGid,
      );

  factory VImagery.fromPlanAndImagery({
    required Plan2D<dynamic> plan,
    required Imagery imagery,
    required int firstGid,
  }) {
    final (isx, isy) = plan.axisSizeImagery(imagery);

    return VImagery.fromImagery(
      planId: plan.id,
      imageryOnPlanWidth: isx,
      imageryOnPlanHeight: isy,
      imagery: imagery,
      firstGid: firstGid,
    );
  }
}