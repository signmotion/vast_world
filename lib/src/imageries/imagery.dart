part of '../../vast_world.dart';

/// The axis size equals to background image size.
abstract class Imagery extends Quant with HasGeometryMix {
  Imagery(
    super.path, {
    super.hid,
    super.uid,
    required (int, int) axisPosition,
    required Unit realWidth,
    Unit? realHeight,
  }) {
    axisWidth = background.image!.width;
    axisHeight = background.image!.height;

    this.axisPosition = axisPosition;
    this.realWidth = realWidth;
    this.realHeight = realHeight ?? Unit.kilometre(axisHeight * scale);
  }
}
