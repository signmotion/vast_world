part of '../../vast_world.dart';

// The base class for keepers.
abstract class Keeper<Q extends Quant, ImgB extends Broker<dynamic>,
    TxtB extends Broker<dynamic>> {
  const Keeper({
    required this.imageBroker,
    required this.textBroker,
    this.readOnly = true,
  });

  static const maxReadPlanDepth = 12;
  static const maxWritePlanDepth = 12;

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

  @mustCallSuper
  Q? read(String id, [int depth = maxReadPlanDepth]) {
    argerr(depth >= 0, depth, 'depth');

    return null;
  }

  /// [T] contains ID.
  @mustCallSuper
  void write(Quant value, [int depth = maxWritePlanDepth]) {
    argerr(depth >= 0, depth, 'depth');

    if (readOnly) {
      throw Exception('Not permitted when readOnly == true.');
    }
  }
}
