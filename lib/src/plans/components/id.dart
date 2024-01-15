part of '../../../vast_world.dart';

typedef IdT = ({
  String hid,
  String uid,
});

class IdComponent extends VComponent<IdT> {
  @override
  void initv(IdT v) => value = (
        hid: v.hid,
        uid: v.uid.isEmpty ? generateUid() : v.uid,
      );

  @override
  void check() {
    arge(hid.isCorrectHid, hid, 'hid');
    arge(uid.isUuid, uid, 'uid');
  }

  @override
  IdT get empty => (hid: '', uid: '');

  /// Human ID for nicely detection.
  String get hid => value.hid;

  /// UUID, version 4.
  String get uid => value.uid;

  /// ID for access.
  String get id => hid.isEmpty ? uid : hid;

  String generateUid() => const UuidV4Gen().get();
}

extension HidExt on String {
  /// Examples:
  /// ```
  /// raeria
  /// ri
  /// elf_sea
  /// askatria_land
  /// ```
  bool get isCorrectHid => RegExp(r'^[a-z0-9_]*$').hasMatch(this);
}
