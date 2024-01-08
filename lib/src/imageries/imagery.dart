import 'package:astronomical_measurements/astronomical_measurements.dart';

import '../quant.dart';

abstract class Imagery extends Quant {
  Imagery(
    super.path, {
    super.hid,
    super.uid,
    required this.position,
    required this.realWidth,
  });

  /// Position into the plan.
  final (int, int) position;

  /// Absolute width in [Unit].
  final Unit realWidth;

  /// Absolute height in [Unit].
  late final Unit realHeight;
}
