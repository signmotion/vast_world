part of '../../vast_world.dart';

// // ignore: must_be_immutable
// class DEPRECATED_Plan2D<C extends Content>
//     extends DEPRECATED_GeometryShape2DQuant<C> with ParentChildCalc2DMix {
//   DEPRECATED_Plan2D(
//     super.pathPrefix,
//     super.hid, {
//     super.uid,
//     required super.realWidth,
//     required super.realHeight,
//     required super.anchor,
//     required super.axisType,
//     required super.scale,
//     required super.shape,
//     super.wantFadeBackground = false,
//     super.initBackground,
//     List<DEPRECATED_Imagery>? imageries,
//     required super.content,
//   }) : super(axisPosition: (0, 0)) {
//     // initialize here for ability change the [imageries]
//     this.imageries = imageries ?? <DEPRECATED_Imagery>[];
//   }

//   /// Unwrap to looped surface by radius.
//   factory DEPRECATED_Plan2D.planet(
//     String pathPrefix,
//     String hid, {
//     Unit? realRadius,
//     Unit? realRadiusX,
//     Unit? realRadiusY,
//     required num scale,
//     bool wantFadeBackground = false,
//     C? content,
//   }) {
//     assert(realRadius != null || (realRadiusX != null && realRadiusY != null),
//         'Should be defined [realRadius] or both [realRadiusX] and [realRadiusY].');

//     final rx = realRadiusX ?? realRadius;
//     final ry = realRadiusY ?? realRadius;
//     assert(rx != null, ry != null);

//     return DEPRECATED_Plan2D.surface(
//       pathPrefix,
//       hid,
//       realWidth: rx! * 2 * pi,
//       realHeight: ry! * 2 * pi,
//       anchor: DEPRECATED_HasGeometry2DMix.defaultAnchor2D,
//       axisType: AxisType.loop,
//       scale: scale,
//       wantFadeBackground: wantFadeBackground,
//       content: content,
//     );
//   }

//   factory DEPRECATED_Plan2D.surface(
//     String pathPrefix,
//     String hid, {
//     required Unit realWidth,
//     required Unit realHeight,
//     Anchor2D anchor = DEPRECATED_HasGeometry2DMix.defaultAnchor2D,
//     AxisType axisType = DEPRECATED_HasGeometry2DMix.defaultAxisType,
//     num scale = 1.0,
//     bool wantFadeBackground = false,
//     C? content,
//   }) =>
//       DEPRECATED_Plan2D<C>(
//         pathPrefix,
//         hid,
//         realWidth: realWidth,
//         realHeight: realHeight,
//         anchor: anchor,
//         axisType: axisType,
//         scale: scale,
//         shape: const InfinityShape(),
//         wantFadeBackground: wantFadeBackground,
//         content: content,
//       );

//   factory DEPRECATED_Plan2D.imageryToPlan(
//     DEPRECATED_Plan2D<C> parentPlan,
//     DEPRECATED_Imagery imagery, {
//     Anchor2D? anchor,
//     AxisType? axisType,
//     bool wantFadeBackground = false,
//     C? content,
//   }) {
//     if (imagery is! DEPRECATED_PictureImagery) {
//       throw UnimplementedError('Not implemented `${imagery.runtimeType}`.');
//     }

//     final path = ph.joinAll(
//         imagery.npath.split(CanWorkWithFile.pathSeparator)..removeLast());

//     return DEPRECATED_Plan2D<C>(
//       path,
//       imagery.hidForPlan,
//       uid: imagery.uid,
//       realWidth: imagery.realWidth,
//       realHeight: imagery.realHeight,
//       anchor: anchor ?? DEPRECATED_HasGeometry2DMix.defaultAnchor2D,
//       axisType: axisType ?? DEPRECATED_HasGeometry2DMix.defaultAxisType,
//       scale: imagery.scale,
//       shape: imagery.shape,
//       wantFadeBackground: wantFadeBackground,
//       initBackground: imagery.background,
//       content: content,
//     );
//   }

//   DEPRECATED_PictureImagery toPictureImagery({
//     required String parentPlanHid,
//     required (int, int) axisPositionInParentPlan,
//   }) =>
//       DEPRECATED_PictureImagery.fromImage(
//         npathWithoutHid,
//         parentPlanHid,
//         lastHid,
//         axisPosition: axisPositionInParentPlan,
//         // the height will be calculated in proportion to the image size
//         realWidth: realWidth,
//         anchor: anchor,
//         axisType: axisType,
//         shape: shape,
//         wantFadeBackground: wantFadeBackground,
//       );

//   DEPRECATED_Plan2D<C> operator +(dynamic o) {
//     if (o is DEPRECATED_Imagery) {
//       addImagery(o);
//     } else {
//       throw UnimplementedError('Unsupported class `$o`.');
//     }

//     return this;
//   }

//   late final List<DEPRECATED_Imagery> imageries;

//   void addImagery(DEPRECATED_Imagery v) => imageries.add(v);

//   void replaceImagery(DEPRECATED_Imagery v) {
//     imageries.removeWhere((imagery) => imagery.hid == v.hid);
//     imageries.add(v);
//   }
// }

// extension PlanHidExt on String {
//   /// Examples:
//   /// ```
//   /// raeria
//   /// ri
//   /// elf_sea
//   /// askatria_land
//   /// ```
//   bool get isCorrectPlanHid => RegExp(r'^[a-z0-9_]*$').hasMatch(this);
// }
