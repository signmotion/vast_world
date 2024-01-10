part of '../vast_world.dart';

mixin HasIdMix on Object {
  /// Human ID for nicely detection.
  late final String? hid;

  /// UUID.
  late final String uid;

  /// ID for access.
  /// Can be [hid] if [hid] defined or [uid] if not.
  String get id => hid ?? uid;

  String generateUid() => const UuidV4Gen().get();
}
