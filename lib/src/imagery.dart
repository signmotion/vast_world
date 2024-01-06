import 'package:astronomical_measurements/astronomical_measurements.dart';

import 'can_load_file.dart';

abstract class Imagery extends Loader {
  Imagery(
    super.pathToFile, {
    required this.position,
    required this.width,
  });

  /// Position on the plan.
  final (int, int) position;

  /// Width on the plan in [Unit] plan scale.
  final Unit width;

  /// Height on the plan in [Unit] plan scale.
  late final Unit height;
}

/// Build imagery by image.
class PictureImagery extends Imagery with LoadFileAsImage {
  PictureImagery(
    super.pathToPictureFile, {
    required super.position,
    required super.width,
  }) {
    final scaleByWidth = width.value / image.width;
    height = Unit.kilometre(image.height * scaleByWidth);
  }
}

/// Build imagery by text description.
class TextImagery extends Imagery with LoadFileAsText {
  TextImagery(
    super.pathToTextFile, {
    required super.position,
    required super.width,
  }) {
    // TODO height = width;
  }
}
