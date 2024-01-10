part of '../../vast_world.dart';

abstract class Quant extends FileWorker with HasIdMix {
  Quant(
    super.pathToBackground, {
    String? hid,
    String? uid,
  }) {
    this.hid = hid ?? extractHid();
    this.uid = uid ?? generateUid();
  }

  // test/data/planet_raw/raeria/bg.png
  // test/data/planet_raw/raeria/r/bg.png
  String extractHid() {
    final splitted = npath.split('/');
    if (splitted.isEmpty) {
      throw ArgumentError("A path `$npath` doesn't contain HID.");
    }

    return splitted.reversed.elementAt(1);
  }

  Background get background => Background(path);
}
