part of '../../vast_world.dart';

/// Build imagery by text description.
class TextImagery extends Imagery with ReadFileAsText {
  TextImagery(
    super.pathToTextFile, {
    required super.position,
    required super.realWidth,
  }) {
    // TODO realHeight = ...
  }
}
