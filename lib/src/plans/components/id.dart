part of '../../../vast_world.dart';

typedef IdT = ({
  String hid,
  String uid,
});

class IdComponent extends VComponent<IdT> with HasStringIdMix {
  @override
  void initv(IdT v) => value = (
        hid: v.hid,
        uid: v.uid,
      );

  @override
  void check() {
    argerr(hid.isEmpty || hid.isCorrectHid, hid, 'hid');
    argerr(uid.isUuid, uid, 'uid');
    ae(hid.isNotEmpty || uid.isNotEmpty, 'Hid or UID should be defined.');
  }

  @override
  IdT get empty => (hid: '', uid: '');

  /// Human ID for nicely detection.
  @override
  String get hid => value.hid;

  /// UUID, version 4.
  @override
  String get uid => value.uid;
}

extension HidExt on String {
  static const hidSeparator = '.';

  bool get isCorrectId => isCorrectHid || isUuid;

  /// Examples:
  /// ```
  /// raeria
  /// ri
  /// elf_sea
  /// askatria_land
  /// ```
  bool get isCorrectHid => RegExp(r'^[a-z0-9_]*$').hasMatch(this);

  List<String> get hidToList => split(hidSeparator);

  String get hidToNPath => replaceAll(hidSeparator, npathSeparator);

  String get pathToHid => npath.split(npathSeparator).listToHid;
}

extension ListHidExt on List<String> {
  String get listToHid => join(HidExt.hidSeparator);
}

extension ExposedHidExt on String {
  /// Examples:
  /// ```
  /// raeria.ri
  /// ri.elf_sea
  /// ```
  bool get isCorrectExposedHid => hidToList.length == 2;
}
