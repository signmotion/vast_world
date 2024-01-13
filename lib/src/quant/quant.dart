part of '../../vast_world.dart';

// ignore: must_be_immutable
abstract class Quant extends BaseEquatable with CanWorkWithFile, HasIdMix {
  Quant(
    String pathPrefix,
    String hid, {
    String? uid,
    Background? initBackground,
  }) : assert(hid.isNotEmpty) {
    path = ph.joinAll([pathPrefix, ...hid.hidToList]);
    if (pathPrefix.isNotEmpty) {
      counstructPath();
    }

    this.hid = hid;
    this.uid = uid ?? generateUid();

    _background = initBackground;
  }

  static const hidSeparator = HidExt.hidSeparator;
  static const pathSeparator = HidExt.pathSeparator;

  String get lastHid => hidAsList.last;
  String get firstHid => hidAsList.last;
  List<String> get hidAsList => hid.split(HidExt.hidSeparator);

  String get npathWithoutHid => npathWithoutTail(hid.hidToNPath);

  Background? _background;

  Background get background =>
      _background ??= Background('$npath/${VMap.defaultBackgroundFilename}');

  set background(Background v) => _background = v;

  @override
  List<Object?> get props => [hid, npath, uid];
}

extension HidExt on String {
  static const hidSeparator = '.';
  static const pathSeparator = PathStringExt.pathSeparator;

  List<String> get hidToList => split(hidSeparator);

  String get hidToNPath => replaceAll(hidSeparator, pathSeparator);

  String get pathToHid => npath.split(pathSeparator).listToHid;
}

extension ListHidExt on List<String> {
  String get listToHid => join(HidExt.hidSeparator);
}
