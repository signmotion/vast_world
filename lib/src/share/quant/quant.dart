part of '../../../vast_world_share.dart';

abstract class Quant with HasProtoBaseMix, HasStringIdMix {
  Quant({
    String? hid,
    String? uid,
  }) {
    this.hid = hid;
    this.uid = uid;
  }
}
