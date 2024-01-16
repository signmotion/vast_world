part of '../../vast_world.dart';

class FileWorker with CanWorkWithFile {
  FileWorker(String path, {bool createPathIfNotExists = false}) {
    this.path = path;

    if (createPathIfNotExists) {
      counstructPath();
    }
  }

  static const pathSeparator = CanWorkWithFile.pathSeparator;
}

mixin CanWorkWithFile on Object {
  static const pathSeparator = PathStringExt.pathSeparator;

  late final String _path;

  /// Path with system delimiter.
  String get path => _path;

  set path(String v) {
    assert(v.isNotEmpty);

    _path = _sanitizePath(v);
  }

  static String _sanitizePath(String v) =>
      ph.joinAll(v.trim().npath.split(PathStringExt.pathSeparator));

  /// Normalized path.
  /// See [PathStringExt.npath].
  String get npath => path.npath;

  String npathWithoutTail(String tail) {
    final np = npath;
    if (tail.isEmpty || !np.endsWith(tail)) {
      return np;
    }

    final i = np.indexOf(tail);

    return i == -1 ? np : np.substring(0, i);
  }

  void counstructPath({bool? hasFile}) => counstructPathToFile(path);

  static void counstructPathToFile(String pathToFile, {bool? hasFile}) {
    hasFile ??= ph.extension(pathToFile).isNotEmpty;
    final dir = hasFile ? ph.dirname(pathToFile) : pathToFile;
    Directory(dir).createSync(recursive: true);
  }

  Uint8List readAsBytes({String? pathToFile}) =>
      File(ph.join(path, pathToFile)).readAsBytesSync();

  JsonMap? readAsJsonMap({String? pathToFile}) =>
      readAsText(pathToFile: pathToFile)?.jsonMap;

  Map<String, String>? readAsJsonMapString({String? pathToFile}) =>
      readAsJsonMap(pathToFile: pathToFile)
          ?.map((k, v) => MapEntry(k, _anyTypeToString(v)));

  Map<String, T>? readAsJsonMapT<T>({String? pathToFile}) =>
      readAsJsonMap(pathToFile: pathToFile)?.map((k, v) => MapEntry(k, v as T));

  JsonList? readAsJsonList({String? pathToFile}) =>
      readAsText(pathToFile: pathToFile)?.jsonList;

  List<String>? readAsJsonListString({String? pathToFile}) =>
      readAsJsonList(pathToFile: pathToFile)
          ?.map((v) => _anyTypeToString(v))
          .toList();

  List<T>? readAsJsonListT<T>({String? pathToFile}) =>
      readAsJsonList(pathToFile: pathToFile)?.map((v) => v as T).toList();

  /// Read image and can get a guarantee an alpha channel.
  /// If the [numChannels] is 4 and the current image does not have an alpha
  /// channel, then the given [alpha] value will be used to set the new alpha
  /// channel.
  /// If [alpha] is not provided, then the [maxChannelValue] will be used to
  /// set the alpha.
  Image readAsImage({String? pathToFile, int? numChannels, num? alpha}) {
    // use filename extension to determine the decoder
    final image = decodeNamedImage(
        ph.join(path, pathToFile), readAsBytes(pathToFile: pathToFile))!;

    return numChannels == null && alpha == null
        ? image
        : image.convert(numChannels: numChannels, alpha: alpha);
  }

  String? readAsText({String? pathToFile}) {
    final file = File(ph.join(path, pathToFile));
    return file.existsSync() ? file.readAsStringSync() : null;
  }

  void writeAsBytes(Uint8List bytes, {String? pathToFile}) {
    final pf = ph.join(path, pathToFile);
    if (pathToFile != null) {
      counstructPathToFile(pf);
    }
    File(pf).writeAsBytesSync(bytes);
  }

  void writeAsImage(Image image, {String? pathToFile}) {
    final pf = ph.join(path, pathToFile);
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
    final pf = ph.join(path, pathToFile);
    if (pathToFile != null) {
      counstructPathToFile(pf);
    }
    File(pf).writeAsStringSync(text);
  }

  String _anyTypeToString(dynamic v) => v.toString();
}

mixin ReadFileAsBytes on CanWorkWithFile {
  Uint8List? _bytes;

  Uint8List? get bytes => _bytes ??= readAsBytes();
}

mixin ReadFileAsJsonMap on CanWorkWithFile {
  JsonMap? _jsonMap;

  JsonMap? get jsonMap => _jsonMap ??= readAsJsonMap();
}

mixin ReadFileAsJsonMapT<T> on CanWorkWithFile {
  Map<String, T>? _jsonMapT;

  Map<String, T>? get jsonMapT => _jsonMapT ??= readAsJsonMapT<T>();
}

mixin ReadFileAsJsonList on CanWorkWithFile {
  JsonList? _jsonList;

  JsonList? get jsonList => _jsonList ??= readAsJsonList();
}

mixin ReadFileAsJsonListT<T> on CanWorkWithFile {
  List<T>? _jsonList;

  List<T>? get jsonList => _jsonList ??= readAsJsonListT<T>();
}

mixin ReadFileAsImage on CanWorkWithFile {
  late final int? numChannels;
  late final num? alpha;

  Image? _image;

  Image? get image =>
      _image ??= readAsImage(numChannels: numChannels, alpha: alpha);
}

mixin ReadFileAsText on CanWorkWithFile {
  String? _text;

  String? get text => _text ??= readAsText();
}

extension PathStringExt on String {
  static const pathSeparator = '/';

  /// Normalized path.
  /// System depends separators replaced to [pathSeparator].
  String get npath => replaceAll('\\', pathSeparator);
}
