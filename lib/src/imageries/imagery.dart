part of '../../vast_world.dart';

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
  int get positionX => position.$1;
  int get positionY => position.$2;

  /// Absolute width in [Unit].
  final Unit realWidth;

  /// Absolute height in [Unit].
  late final Unit realHeight;

  /// The axis size equals to background image size.
  int get axisWidth => background.image!.width;
  int get axisHeight => background.image!.height;

  double get scale => realWidth.value / axisWidth;
}
