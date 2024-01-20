part of '../../vast_world.dart';

class DEPRECATED_Background extends WFile with ReadFileAsImage {
  DEPRECATED_Background(super.pathToImageFile, {Image? image})
      : assert(pathToImageFile.isNotEmpty || image != null) {
    numChannels = 4;
    alpha = null;
    this.image = image;
  }

  factory DEPRECATED_Background.fromPathToImageFile(String pathToImageFile) =>
      DEPRECATED_Background(pathToImageFile);

  factory DEPRECATED_Background.fromImage(Image initImage) =>
      DEPRECATED_Background('', image: initImage);
}
