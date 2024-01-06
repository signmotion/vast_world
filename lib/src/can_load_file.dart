import 'dart:io';
import 'dart:typed_data';

import 'package:image/image.dart';
import 'package:path/path.dart' as p;

class Loader with CanLoadFile {
  Loader(String path) {
    this.path = path;
  }
}

mixin CanLoadFile on Object {
  late final String _path;

  /// Path with system delimiter.
  String get path => _path;

  set path(String v) {
    assert(v.isNotEmpty);

    _path = p.joinAll(v.trim().replaceAll('\\', '/').split('/'));
  }

  /// Path with '/' delimiter.
  String get npath => path.replaceAll('\\', '/');

  Uint8List loadAsBytes() => File(path).readAsBytesSync();

  Image loadAsImage() =>
      // use filename extension to determine the decoder
      decodeNamedImage(path, loadAsBytes())!;

  String loadAsText() => File(path).readAsStringSync();
}

mixin LoadFileAsImage on CanLoadFile {
  Image? _image;

  Image get image => _image ??= loadAsImage();
}

mixin LoadFileAsText on CanLoadFile {
  String? _text;

  String get text => _text ??= loadAsText();
}
