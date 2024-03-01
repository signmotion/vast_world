part of '../../../vast_world_share.dart';

/// See [UidExt], [HidExt].
extension IdExt on String {
  bool get isPlanId => isPlanHid || isPlanUid;
}
