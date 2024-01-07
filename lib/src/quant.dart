import 'package:id_gen/id_gen.dart';

class Quant {
  Quant({this.hid = ''}) : uid = const UuidV4Gen().get();

  /// Human ID for nicely detection.
  final String hid;

  /// UUID.
  final String uid;

  /// ID for access.
  /// Can be [hid] if [hid] defined or [uid] if not.
  String get id => hid.isEmpty ? uid : hid;
}
