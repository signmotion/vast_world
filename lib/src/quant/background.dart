part of '../../vast_world.dart';

class Background extends WFile with ReadFileAsImage {
  Background(super.pathToImageFile, {Image? image})
      : assert(pathToImageFile.isNotEmpty || image != null) {
    numChannels = 4;
    alpha = null;
    this.image = image;
  }

  factory Background.fromPathToImageFile(String pathToImageFile) =>
      Background(pathToImageFile);

  factory Background.fromImage(Image initImage) =>
      Background('', image: initImage);
}
