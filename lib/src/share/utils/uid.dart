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
  bool get isActHid => isNotEmpty && !isActUid;

  bool get isComponentUid => isUuidWithPrefix(componentUidPrefix);
  bool get isComponentHid => isNotEmpty && !isComponentUid;

  bool get isPlanUid => isUuidWithPrefix(planUidPrefix);
  bool get isPlanHid => isNotEmpty && !isPlanUid;

  bool get isSessionUid => isUuidWithPrefix(sessionUidPrefix);
}
