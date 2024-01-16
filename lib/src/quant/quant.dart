part of '../../vast_world.dart';

abstract class Quant with HasIdMix {
  Quant({
    String hid = '',
    String uid = '',
  }) {
    this.hid = hid;
    this.uid = uid.isEmpty ? generateUid() : uid;
  }
}
