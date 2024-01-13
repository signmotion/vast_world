part of '../../vast_world.dart';

/// Build imagery by image.
// ignore: must_be_immutable
class PictureImagery extends Imagery {
  PictureImagery(
    super.pathPrefix,
    super.planHid,
    super.imageryHid, {
    super.uid,
    required super.axisPosition,
    required super.realWidth,
    required super.realHeight,
    required super.anchor,
    required super.axisType,
    required super.scale,
    required super.shape,
    super.wantFadeBackground = false,
  });

  factory PictureImagery.fromImage(
    String pathPrefix,
    String planHid,
    String imageryHid, {
    String? uid,
    required (int, int) axisPosition,
    required Unit realWidth,
    required Anchor2D anchor,
    required AxisType axisType,
    required Shape2D shape,
    bool wantFadeBackground = false,
  }) {
    final pathToImageFile = ph.joinAll(
        [pathPrefix, planHid, imageryHid, VMap.defaultBackgroundFilename]);
    final bg = Background(pathToImageFile);
    final axisWidth = bg.image!.width;
    final axisHeight = bg.image!.height;

    final scale = realWidth.value / axisWidth;

    return PictureImagery(
      pathPrefix,
      planHid,
      imageryHid,
      uid: uid,
      axisPosition: axisPosition,
      realWidth: realWidth,
      realHeight: Unit.kilometre(axisHeight * scale),
      anchor: anchor,
      axisType: axisType,
      scale: scale,
      shape: shape,
      wantFadeBackground: wantFadeBackground,
    );
  }
}
