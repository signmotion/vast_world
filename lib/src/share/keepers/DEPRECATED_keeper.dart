part of '../../../vast_world_share.dart';

/// The base class for keepers.
// abstract class Keeper<Q extends DEPRECATED_Quant, ImgB extends Broker<dynamic>,
//     TxtB extends Broker<dynamic>> {
//   const Keeper({
//     required this.imageBroker,
//     required this.textBroker,
//     this.readOnly = true,
//   });

//   final ImgB imageBroker;
//   final TxtB textBroker;

//   /// If `true` then prevent call methods [clear] and [write].
//   final bool readOnly;

//   @mustCallSuper
//   void clear() {
//     if (readOnly) {
//       throw Exception('Not permitted when readOnly == true.');
//     }

//     imageBroker.clear();
//     textBroker.clear();
//   }

//   bool exists(String id) => imageBroker.exists(id) || textBroker.exists(id);

//   Q? read(String id);

//   /// [T] contains ID.
//   @mustCallSuper
//   void write(Q value) {
//     if (readOnly) {
//       throw Exception('Not permitted when readOnly == true.');
//     }
//   }
// }
