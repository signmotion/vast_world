part of '../../vast_world.dart';

mixin HasIdMix on Object {
  /// Human ID for nicely detection.
  String get hid;

  /// UUID.
  String get uid;

  /// ID for access.
  String get id => hid.isEmpty ? uid : hid;

  String generateUid() => const UuidV4Gen().get();
}
