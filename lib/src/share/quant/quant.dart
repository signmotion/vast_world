part of '../../../vast_world_share.dart';

abstract class Quant with HasProtoBaseMix, HasStringIdMix {
  Quant({
    String? hid,
    String? uid,
  }) {
    this.hid = hid;
    this.uid = uid;
  }

  /// Should be implemented for each descendant.
  @override
  bool get isCorrectUid =>
      throw UnimplementedError('Should be defined for each descendant and'
          ' consider to [is*Uid] checkers.');
}
