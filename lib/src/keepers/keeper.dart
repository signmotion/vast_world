import '../brokers/broker.dart';
import '../quant.dart';

/// The base class for keepers.
abstract class Keeper<T extends Quant, B extends Broker<dynamic>> {
  const Keeper(this.broker);

  final B broker;

  bool exists(String id);

  T? read(String id);

  /// [T] contains ID.
  void write(T value);
}
