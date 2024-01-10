part of '../vast_world.dart';

mixin ParentChildCalcMix on HasGeometryMix {
  /// An axis size of [child] into the parent.
  /// For example, [Imagery] on [Plan].
  (int, int) axisSizeChildInParent(HasGeometryMix child) {
    final nepper = child.realWidth.nepper(realWidth);
    final w = axisWidth * nepper;
    final k = w / child.axisWidth;
    final h = child.axisHeight * k;

    return (w.ceil(), h.ceil());
  }
}
