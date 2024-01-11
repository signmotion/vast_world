part of '../../vast_world.dart';

abstract class Quant extends FileWorker with HasIdMix {
  Quant(
    String pathPrefix,
    String hid, {
    String? uid,
  })  : assert(hid.isNotEmpty),
        super(ph.joinAll([pathPrefix, ...hid.hidToList])) {
    this.hid = hid;
    this.uid = uid ?? generateUid();
  }

  static const hidSeparator = HidExt.hidSeparator;
  static const pathSeparator = HidExt.pathSeparator;

  Background get background =>
      Background('$npath/${VMap.defaultBackgroundFilename}');
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
