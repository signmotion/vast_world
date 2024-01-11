part of '../../vast_world.dart';

/// The axis size equals to background image size.
abstract class Imagery extends Quant with HasGeometryMix {
  Imagery(
    String pathPrefix,
    String planHid,
    String imageryHid, {
    super.uid,
    required (int, int) axisPosition,
    required Unit realWidth,
    Unit? realHeight,
  })  : assert(planHid.isNotEmpty),
        assert(imageryHid.isNotEmpty),
        super(
          pathPrefix,
          [planHid, imageryHid].join(Quant.hidSeparator),
        ) {
    axisWidth = background.image!.width;
    axisHeight = background.image!.height;

    this.axisPosition = axisPosition;

    this.realWidth = realWidth;
    this.realHeight = realHeight ?? Unit.kilometre(axisHeight * scale);
  }

  String get hidForPlan => hid.split(HidExt.hidSeparator).last;
}
