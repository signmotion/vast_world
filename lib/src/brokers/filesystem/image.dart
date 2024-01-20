part of '../../../vast_world.dart';

class ImageFilesystemBroker extends FilesystemBroker<Image> {
  /// See [readAsImage()] notes for [numChannels] and [alpha].
  ImageFilesystemBroker(
    super.path, {
    this.numChannels,
    this.alpha,
  });

  final int? numChannels;
  final num? alpha;

  @override
  Image? read(String key) =>
      readAsImage(pathToFile: key, numChannels: numChannels, alpha: alpha);

  @override
  void write(String key, Image value) => writeAsImage(value, key);
}