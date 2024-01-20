part of '../../../vast_world.dart';

class TextFilesystemBroker extends FilesystemBroker<String> {
  TextFilesystemBroker(super.path);

  @override
  String? read(String key) => readAsText(key);

  @override
  void write(String key, String value) => writeAsText(value, key);
}
