part of '../../vast_world.dart';

/// Build imagery by text description.
// ignore: must_be_immutable
class DEPRECATED_TextImagery extends DEPRECATED_Imagery with ReadFileAsText {
  DEPRECATED_TextImagery(
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
  }) {
    // TODO realHeight = ...
  }
}
