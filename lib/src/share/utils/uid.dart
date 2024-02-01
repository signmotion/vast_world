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
  bool get isActHid => isNotEmpty && !isActUid;
  bool get isActUid => isUuidWithPrefix(actUidPrefix);

  bool get isComponentHid => isCorrectHid && !isComponentUid;
  bool get isComponentUid => isUuidWithPrefix(componentUidPrefix);

  bool get isPlanHid => isCorrectHid && !isPlanUid;
  bool get isPlanUid => isUuidWithPrefix(planUidPrefix);

  bool get isSessionUid => isUuidWithPrefix(sessionUidPrefix);

  bool get isCorrectHid => RegExp(r'^[a-z0-9_]*$').hasMatch(this);
  bool get isCorrectUid => isUuid || isUuidWithPrefix();
}
