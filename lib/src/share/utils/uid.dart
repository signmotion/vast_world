part of '../../../vast_world_share.dart';

String get fixedActUid => '$actUidPrefix-00000000-0000-0000-0000-000000000000';
String get genActUid => '$actUidPrefix-$genUuid';
const actUidPrefix = 'a';

String get fixedComponentUid =>
    '$componentUidPrefix-00000000-0000-0000-0000-000000000000';
String get genComponentUid => '$componentUidPrefix-$genUuid';
const componentUidPrefix = 'c';

String get fixedPlanUid =>
    '$planUidPrefix-00000000-0000-0000-0000-000000000000';

/// See [genHid].
String get genPlanUid => '$planUidPrefix-$genUuid';
const planUidPrefix = 'p';

String get fixedSessionUid =>
    '$sessionUidPrefix-00000000-0000-0000-0000-000000000000';
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
