// ignore_for_file: inference_failure_on_function_invocation

part of '../../vast_world.dart';

class Plan2D extends Universe {
  Plan2D() {
    component(IdComponent.new);
    component(BackgroundComponent.new);
    component(Geometry2DComponent.new);

    // TODO universe.registerComponent(() => Imagery2DComponent);
    // TODO universe.registerComponent(() => Cell2DContentComponent);
  }

  factory Plan2D.construct(
    String hid, {
    String uid = '',
    required Background Function() backgroundLoader,
    Vector2? axisPosition,
    required Unit2 realSize,
    required Unit realHeight,
    required double scale,
    required Shape2D shape,
  }) {
    final plan = Plan2D();
    plan.construct(hid)
      ..add<IdComponent, IdT>((hid: hid, uid: uid))
      ..add<BackgroundComponent, BackgroundT>(backgroundLoader())
      ..add<Geometry2DComponent, Geometry2DT>(
        (
          axisPosition: axisPosition,
          axisSize: axisSizeFromRealSize(realSize, scale),
          realSize: realSize,
          scale: scale,
          shape: shape,
        ),
      );

    return plan;
  }
}
