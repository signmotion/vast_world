part of '../../../vast_world_share.dart';

// ignore: must_be_immutable
// abstract class DEPRECATED_Quant<C extends Content> extends BaseEquatable
//     with CanWorkWithFile, DEPRECATED_HasIdMix {
//   DEPRECATED_Quant(
//     String pathPrefix,
//     String hid, {
//     String? uid,
//     Background? initBackground,
//     this.content,
//   }) : assert(hid.isNotEmpty) {
//     path = ph.joinAll([pathPrefix, ...hid.hidToList]);
//     if (pathPrefix.isNotEmpty) {
//       counstructPath();
//     }

//     this.hid = hid;
//     this.uid = uid ?? generateUid();

//     _background = initBackground;
//   }

//   static const hidSeparator = HidExt.hidSeparator;
//   static const pathSeparator = HidExt.pathSeparator;

//   String get lastHid => hidAsList.last;
//   String get firstHid => hidAsList.last;
//   List<String> get hidAsList => hid.split(HidExt.hidSeparator);

//   String get npathWithoutHid => npathWithoutTail(hid.hidToNPath);

//   Background? _background;

//   Background get background =>
//       _background ??= Background('$npath/${VMap.defaultBackgroundFilename}');

//   set background(Background v) => _background = v;

//   late final C? content;

//   @override
//   List<Object?> get props => [hid, npath, uid, content];
// }
