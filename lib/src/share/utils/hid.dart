part of '../../../vast_world_share.dart';

/// See [genPlanUid].
String genHid(String s) => _genHid.get(s);

const _genHid = HumanIdGen(
  options: HumanIdGenOptions(
    separator: '_',
    lowerCase: true,
  ),
);

/// See [UidExt].
/// \see [HumanIdGen]
extension HidExt on String {
  bool get isActHid => isNotEmpty && !isActUid;

  bool get isComponentHid => isCorrectHid && !isComponentUid;

  bool get isPlanHid => isCorrectHid && !isPlanUid;

  bool get isCorrectHid => RegExp(r'^[a-z0-9_]*$').hasMatch(this);
}

extension HidPathExt on String {
  static const hidSeparator = '.';

  //bool get isCorrectId => isCorrectHid || isUuid;

  /// Examples:
  /// ```
  /// raeria
  /// ri
  /// elf_sea
  /// askatria_land
  /// ```
  //bool get isCorrectHid => RegExp(r'^[a-z0-9_]*$').hasMatch(this);

  List<String> get hidToList => split(hidSeparator);

  String get hidToNPath => replaceAll(hidSeparator, npathSeparator);

  String get pathToHid => npath.split(npathSeparator).listToHid;
}

extension ListHidPathExt on List<String> {
  String get listToHid => join(HidPathExt.hidSeparator);
}
