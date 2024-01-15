part of '../../vast_world.dart';

mixin DEPRECATED_HasIdMix on Object {
  /// Human ID for nicely detection.
  late final String hid;

  /// UUID.
  late final String uid;

  /// ID for access.
  String get id => hid;

  String generateUid() => const UuidV4Gen().get();
}
