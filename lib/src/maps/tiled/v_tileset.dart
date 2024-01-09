import 'package:dart_tiledmap/dart_tiledmap.dart';

import '../../imageries/imagery.dart';
import '../../plan2d.dart';
import 'v_image.dart';

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

class VImageryTileset extends VTileset {
  VImageryTileset({
    required super.name,
    required super.tileWidth,
    required super.tileHeight,
    required super.image,
    required super.firstGid,
  }) : super(tileCount: 1);

  factory VImageryTileset.fromImagery({
    required String planId,
    required int imageryOnPlanWidth,
    required int imageryOnPlanHeight,
    required Imagery imagery,
    required int firstGid,
  }) =>
      VImageryTileset(
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

  factory VImageryTileset.fromPlanAndImagery({
    required Plan2D<dynamic> plan,
    required Imagery imagery,
    required int firstGid,
  }) {
    final (isx, isy) = plan.axisSizeImagery(imagery);

    return VImageryTileset.fromImagery(
      planId: plan.id,
      imageryOnPlanWidth: isx,
      imageryOnPlanHeight: isy,
      imagery: imagery,
      firstGid: firstGid,
    );
  }
}
