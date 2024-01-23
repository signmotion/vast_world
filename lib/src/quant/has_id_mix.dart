part of '../../vast_world.dart';

mixin HasIdMix on Object {
  /// Human ID for nicely detection.
  late final String hid;

  /// UUID.
  late final String uid;

  /// ID for access.
  String get id => hid.isEmpty ? uid : hid;

  String generateUid() => genUuid;
}
