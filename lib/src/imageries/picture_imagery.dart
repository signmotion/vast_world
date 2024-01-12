part of '../../vast_world.dart';

/// Build imagery by image.
// ignore: must_be_immutable
class PictureImagery extends Imagery {
  PictureImagery(
    super.pathPrefix,
    super.planHid,
    super.imageryHid, {
    required super.axisPosition,
    required super.realWidth,
  });
}
