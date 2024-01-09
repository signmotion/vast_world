part of '../../vast_world.dart';

/// Build imagery by image.
class PictureImagery extends Imagery {
  PictureImagery(
    super.pathToPicture, {
    required super.position,
    required super.realWidth,
  }) {
    realHeight = Unit.kilometre(axisHeight * scale);
  }
}
