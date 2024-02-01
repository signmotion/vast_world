part of '../../../../vast_world_share.dart';

abstract class FilesystemBroker<T> extends Broker<T> with CanWorkWithFile {
  FilesystemBroker(String path) {
    this.path = path;

    counstructPath();
  }

  @override
  String get prefix => npath;

  @override
  bool exists(String key) => existsAny(key);

  @override
  void clear() {
    final directory = Directory(path);
    if (directory.existsSync()) {
      directory.deleteSync(recursive: true);
    }

    counstructPath();
  }
}