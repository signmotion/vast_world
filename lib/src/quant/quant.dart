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
  // test/data/planet_raw/raeria/ri/bg.png
  String extractHid() => npath.split('/').reversed.elementAt(1);

  Background get background => Background(path);
}
