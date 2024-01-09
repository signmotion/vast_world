import '../brokers/broker.dart';
import '../quant.dart';

/// The base class for keepers.
abstract class Keeper<Q extends Quant, ImgB extends Broker<dynamic>,
    TxtB extends Broker<dynamic>> {
  const Keeper({
    required this.imageBroker,
    required this.textBroker,
  });

  final ImgB imageBroker;
  final TxtB textBroker;

  bool exists(String id);

  Q? read(String id);

  /// [T] contains ID.
  void write(Q value);
}
