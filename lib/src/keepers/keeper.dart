part of '../../vast_world.dart';

/// The base class for keepers.
abstract class Keeper<Q extends Quant, ImgB extends Broker<dynamic>,
    TxtB extends Broker<dynamic>> {
  const Keeper({
    required this.imageBroker,
    required this.textBroker,
  });

  final ImgB imageBroker;
  final TxtB textBroker;

  void clear() {
    imageBroker.clear();
    textBroker.clear();
  }

  bool exists(String id) => imageBroker.exists(id) || textBroker.exists(id);

  Q? read(String id);

  /// [T] contains ID.
  void write(Q value);
}
