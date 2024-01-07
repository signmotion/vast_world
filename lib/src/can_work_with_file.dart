import 'dart:io';
import 'dart:typed_data';

import 'package:image/image.dart';
import 'package:path/path.dart' as p;

class FileWorker with CanWorkWithFile {
  FileWorker(String path, {bool createPathIfNotExists = false}) {
    this.path = path;

    if (createPathIfNotExists) {
      final hasFile = p.extension(path).isNotEmpty;
      counstructPath(hasFile: hasFile);
    }
  }
}

mixin CanWorkWithFile on Object {
  late final String _path;

  /// Path with system delimiter.
  String get path => _path;

  set path(String v) {
    assert(v.isNotEmpty);

    _path = _sanitizePath(v);
  }

  static String _sanitizePath(String v) =>
      p.joinAll(v.trim().replaceAll('\\', '/').split('/'));

  /// Path with '/' delimiter.
  String get npath => path.replaceAll('\\', '/');

  void counstructPath({bool hasFile = false}) {
    final dir = hasFile ? p.dirname(path) : path;
    final directory = Directory(dir);
    directory.createSync(recursive: true);
  }

  Uint8List readAsBytes({String? filename}) =>
      File(p.join(path, filename)).readAsBytesSync();

  Image readAsImage({String? filename}) =>
      // use filename extension to determine the decoder
      decodeNamedImage(p.join(path, filename), readAsBytes())!;

  String? readAsText({String? filename}) {
    final file = File(p.join(path, filename));
    return file.existsSync() ? file.readAsStringSync() : null;
  }

  void writeAsBytes(Uint8List bytes, {String? filename}) =>
      File(p.join(path, filename)).writeAsBytesSync(bytes);

  void writeAsImage(Image image, {String? filename}) {
    final pf = p.join(path, filename);
    final encoder = findEncoderForNamedImage(pf);
    if (encoder == null) {
      throw Exception('Not found an encoder by extension for file `$pf`.');
    }

    final bytes = encoder.encode(image);
    File(pf).writeAsBytesSync(bytes);
  }

  void writeAsText(String text, {String? filename}) =>
      File(p.join(path, filename)).writeAsStringSync(text);
}

mixin ReadFileAsBytes on CanWorkWithFile {
  Uint8List? _bytes;

  Uint8List? get bytes => _bytes ??= readAsBytes();
}

mixin ReadFileAsImage on CanWorkWithFile {
  Image? _image;

  Image? get image => _image ??= readAsImage();
}

mixin ReadFileAsText on CanWorkWithFile {
  String? _text;

  String? get text => _text ??= readAsText();
}
