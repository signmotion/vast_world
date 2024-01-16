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
    argerr(hid.isEmpty || hid.isCorrectHid, hid, 'hid');
    argerr(uid.isUuid, uid, 'uid');
    ae(hid.isNotEmpty || uid.isNotEmpty, 'Hid or UID should be defined.');
  }

  @override
  IdT get empty => (hid: '', uid: '');

  /// ID for access.
  String get id => hid.isEmpty ? uid : hid;

  /// Human ID for nicely detection.
  String get hid => value.hid;

  /// UUID, version 4.
  String get uid => value.uid;

  String generateUid() => const UuidV4Gen().get();
}

extension HidExt on String {
  static const hidSeparator = '.';
  static const pathSeparator = PathStringExt.pathSeparator;

  /// Examples:
  /// ```
  /// raeria
  /// ri
  /// elf_sea
  /// askatria_land
  /// ```
  bool get isCorrectHid => RegExp(r'^[a-z0-9_]*$').hasMatch(this);

  List<String> get hidToList => split(hidSeparator);

  String get hidToNPath => replaceAll(hidSeparator, pathSeparator);

  String get pathToHid => npath.split(pathSeparator).listToHid;
}

extension ListHidExt on List<String> {
  String get listToHid => join(HidExt.hidSeparator);
}

extension ImageryHidExt on String {
  /// Examples:
  /// ```
  /// raeria.ri
  /// ri.elf_sea
  /// ```
  bool get isCorrectImageryHid => hidToList.length == 2;
}
