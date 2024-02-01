part of '../../../vast_world_share.dart';

mixin ParentChildCalc2DMix on DEPRECATED_HasGeometry2DMix {
  /// An axis size of [child] into the parent.
  /// For example, [DEPRECATED_Imagery] on [Plan].
  (int, int) axisSizeChildInParent(DEPRECATED_HasGeometry2DMix child) =>
      axisSizeInParent(child.realWidth, (child.axisWidth, child.axisHeight));

  (int, int) axisSizeInParent(Unit realWidthChild, (int, int) axisSizeChild) {
    assert(axisSizeChild.$1 >= 0, 'Negative width.');
    assert(axisSizeChild.$2 >= 0, 'Negative height.');

    final nepper = realWidthChild.nepper(realWidth);
    final w = axisWidth * nepper;
    final k = w / axisSizeChild.$1;
    final h = axisSizeChild.$2 * k;

    return (w.round(), h.round());
  }
}
