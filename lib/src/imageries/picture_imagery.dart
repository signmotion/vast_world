import 'package:astronomical_measurements/astronomical_measurements.dart';

import 'imagery.dart';

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
