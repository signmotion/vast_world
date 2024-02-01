part of '../../../vast_world_share.dart';

const actUidPrefix = 'a';
String get genActUid => '$actUidPrefix-$genUuid';

const componentUidPrefix = 'c';
String get genComponentUid => '$componentUidPrefix-$genUuid';

const planUidPrefix = 'p';
String get genPlanUid => '$planUidPrefix-$genUuid';

const sessionUidPrefix = 's';
String get genSessionUid => '$sessionUidPrefix-$genUuid';

/// \see [genUuid]
extension UidExt on String {
  bool get isActUid => isUuidWithPrefix(actUidPrefix);

  bool get isComponentUid => isUuidWithPrefix(componentUidPrefix);

  bool get isPlanUid => isUuidWithPrefix(planUidPrefix);

  bool get isSessionUid => isUuidWithPrefix(sessionUidPrefix);
}
