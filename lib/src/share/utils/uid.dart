part of '../../../vast_world_share.dart';

String get genActUid => '$actUidPrefix-$genUuid';
const actUidPrefix = 'a';

String get genComponentUid => '$componentUidPrefix-$genUuid';
const componentUidPrefix = 'c';

/// See [genHid].
String get genPlanUid => '$planUidPrefix-$genUuid';
const planUidPrefix = 'p';

String get genSessionUid => '$sessionUidPrefix-$genUuid';
const sessionUidPrefix = 's';

/// See [HidExt].
/// See [genUuid].
extension UidExt on String {
  bool get isActUid => isUuidWithPrefix(actUidPrefix);

  bool get isComponentUid => isUuidWithPrefix(componentUidPrefix);

  bool get isPlanUid => isUuidWithPrefix(planUidPrefix);

  bool get isSessionUid => isUuidWithPrefix(sessionUidPrefix);

  bool get isCorrectUid => isUuid || isUuidWithPrefix();
}
