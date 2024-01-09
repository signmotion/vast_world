import 'dart:io';

import '../can_work_with_file.dart';
import 'broker.dart';

abstract class FilesystemBroker<T> extends Broker<T> with CanWorkWithFile {
  FilesystemBroker(String path) {
    this.path = path;

    counstructPath();
  }

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

class StringFilesystemBroker extends FilesystemBroker<String> {
  StringFilesystemBroker(super.path);

  @override
  String? read(String key) => readAsText(pathToFile: key);

  @override
  void write(String key, String value) => writeAsText(value, pathToFile: key);
}
