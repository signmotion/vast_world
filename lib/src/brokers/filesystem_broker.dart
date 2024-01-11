part of '../../vast_world.dart';

abstract class FilesystemBroker<T> extends Broker<T> with CanWorkWithFile {
  FilesystemBroker(String path) {
    this.path = path;

    counstructPath();
  }

  @override
  String get pathPrefix => npath;

  @override
  bool exists(String key) => File(key).existsSync();

  @override
  void clear() {
    final directory = Directory(path);
    if (directory.existsSync()) {
      directory.deleteSync(recursive: true);
    }

    counstructPath();
  }
}

class ImageFilesystemBroker extends FilesystemBroker<Image> {
  ImageFilesystemBroker(super.path);

  @override
  Image? read(String key) => readAsImage(pathToFile: key);

  @override
  void write(String key, Image value) => writeAsImage(value, pathToFile: key);
}

class TextFilesystemBroker extends FilesystemBroker<String> {
  TextFilesystemBroker(super.path);

  @override
  String? read(String key) => readAsText(pathToFile: key);

  @override
  void write(String key, String value) => writeAsText(value, pathToFile: key);
}
