import 'package:astronomical_measurements/astronomical_measurements.dart';

import 'imagery.dart';

/// Build imagery by image.
class PictureImagery extends Imagery {
  PictureImagery(
    super.pathToPicture, {
    required super.position,
    required super.realWidth,
  }) {
    final scaleByWidth = realWidth.value / image!.width;
    realHeight = Unit.kilometre(image!.height * scaleByWidth);
  }
}
