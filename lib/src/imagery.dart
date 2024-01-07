import 'package:astronomical_measurements/astronomical_measurements.dart';

import 'can_work_with_file.dart';

abstract class Imagery extends FileWorker {
  Imagery(
    super.pathToFile, {
    required this.position,
    required this.realWidth,
  });

  /// Position into the plan.
  final (int, int) position;

  /// Absolute width in [Unit].
  final Unit realWidth;

  /// Absolute height in [Unit].
  late final Unit realHeight;
}

/// Build imagery by image.
class PictureImagery extends Imagery with ReadFileAsImage {
  PictureImagery(
    super.pathToPictureFile, {
    required super.position,
    required super.realWidth,
  }) {
    final scaleByWidth = realWidth.value / image!.width;
    realHeight = Unit.kilometre(image!.height * scaleByWidth);
  }
}

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
