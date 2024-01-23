part of '../../vast_world.dart';

abstract class Quant with HasStringIdMix {
  Quant({
    String? hid,
    String? uid,
  }) {
    this.hid = hid;
    this.uid = uid;
  }
}
