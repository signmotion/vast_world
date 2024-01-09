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

  /// Normalized path.
  /// Path with '/' delimiter.
  String get npath => path.replaceAll('\\', '/');

  void counstructPath({bool? hasFile}) => counstructPathToFile(path);

  static void counstructPathToFile(String pathToFile, {bool? hasFile}) {
    hasFile ??= p.extension(pathToFile).isNotEmpty;
    final dir = hasFile ? p.dirname(pathToFile) : pathToFile;
    Directory(dir).createSync(recursive: true);
  }

  Uint8List readAsBytes({String? pathToFile}) =>
      File(p.join(path, pathToFile)).readAsBytesSync();

  Image readAsImage({String? pathToFile}) =>
      // use filename extension to determine the decoder
      decodeNamedImage(p.join(path, pathToFile), readAsBytes())!;

  String? readAsText({String? pathToFile}) {
    final file = File(p.join(path, pathToFile));
    return file.existsSync() ? file.readAsStringSync() : null;
  }

  void writeAsBytes(Uint8List bytes, {String? pathToFile}) {
    final pf = p.join(path, pathToFile);
    if (pathToFile != null) {
      counstructPathToFile(pf);
    }
    File(pf).writeAsBytesSync(bytes);
  }

  void writeAsImage(Image image, {String? pathToFile}) {
    final pf = p.join(path, pathToFile);
    if (pathToFile != null) {
      counstructPathToFile(pf);
    }
    final encoder = findEncoderForNamedImage(pf);
    if (encoder == null) {
      throw Exception('Not found an encoder by extension for file `$pf`.');
    }

    final bytes = encoder.encode(image);
    File(pf).writeAsBytesSync(bytes);
  }

  void writeAsText(String text, {String? pathToFile}) {
    final pf = p.join(path, pathToFile);
    if (pathToFile != null) {
      counstructPathToFile(pf);
    }
    File(pf).writeAsStringSync(text);
  }
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
