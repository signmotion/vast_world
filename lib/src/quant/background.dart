part of '../../vast_world.dart';

class Background extends FileWorker with ReadFileAsImage {
  Background(super.pathToImageFile, {Image? initImage}) {
    numChannels = 4;
    alpha = null;

    _image = initImage;
  }

  factory Background.fromImage(String pathToImageFile, Image initImage) =>
      Background(pathToImageFile, initImage: initImage);
}
