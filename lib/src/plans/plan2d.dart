// ignore_for_file: inference_failure_on_function_invocation

part of '../../vast_world.dart';

// class Plan2D extends Universe {
//   Plan2D() {
//     registerComponent(IdComponent.new);
//     registerComponent(BackgroundComponent.new);
//     registerComponent(Geometry2DComponent.new);

//     // TODO universe.registerComponent(() => Imagery2DComponent);
//     // TODO universe.registerComponent(() => Cell2DContentComponent);
//   }

//   factory Plan2D.construct(
//     String hid, {
//     String uid = '',
//     required Background Function() backgroundLoader,
//     required Unit2 realSize,
//     required Unit realHeight,
//     required double scale,
//     required Shape2D shape,
//   }) {
//     final plan = Plan2D();
//     plan.construct(hid)
//       ..add<IdComponent, IdT>((hid: hid, uid: uid))
//       ..add<BackgroundComponent, BackgroundT>(backgroundLoader())
//       ..add<Geometry2DComponent, Geometry2DT>(
//         (
//           axisSize: axisSizeFromRealSize(realSize, scale),
//           realSize: realSize,
//           unitType: null,
//           scale: scale,
//           shape: shape,
//         ),
//       );

//     return plan;
//   }
// }
