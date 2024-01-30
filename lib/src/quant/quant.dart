part of '../../vast_world.dart';

abstract class Quant with HasStringIdMix {
  Quant({
    String? hid,
    String? uid,
  }) {
    this.hid = hid;
    this.uid = uid;
  }

  GeneratedMessage get base;

  JsonMap get baseAsJson => base.toProto3Json() as JsonMap;

  GeneratedMessage jsonAsBase(JsonMap json);
}
