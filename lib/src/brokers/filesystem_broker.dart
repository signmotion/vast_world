import 'dart:io';

import 'broker.dart';
import '../can_work_with_file.dart';

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
  String? read(String key) => readAsText(filename: key);

  @override
  void write(String key, String value) => writeAsText(value, filename: key);
}
