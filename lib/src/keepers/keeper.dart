part of '../../vast_world.dart';

// The base class for keepers.
abstract class Keeper<Q extends Quant, ImgB extends Broker<dynamic>,
    TxtB extends Broker<dynamic>> {
  const Keeper({
    required this.imageBroker,
    required this.textBroker,
    this.readOnly = true,
  });

  final ImgB imageBroker;
  final TxtB textBroker;

  /// If `true` then prevent call methods [clear] and [write].
  final bool readOnly;

  @mustCallSuper
  void clear() {
    if (readOnly) {
      throw Exception('Not permitted when readOnly == true.');
    }

    imageBroker.clear();
    textBroker.clear();
  }

  bool exists(String id) => imageBroker.exists(id) || textBroker.exists(id);

  Q? read(String id, int depth);

  /// [T] contains ID.
  @mustCallSuper
  void write(Quant value, int depth) {
    if (readOnly) {
      throw Exception('Not permitted when readOnly == true.');
    }
  }
}
