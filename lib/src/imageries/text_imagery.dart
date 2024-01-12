part of '../../vast_world.dart';

/// Build imagery by text description.
// ignore: must_be_immutable
class TextImagery extends Imagery with ReadFileAsText {
  TextImagery(
    super.pathPrefix,
    super.planHid,
    super.imageryHid, {
    required super.axisPosition,
    required super.realWidth,
  }) {
    // TODO realHeight = ...
  }
}
