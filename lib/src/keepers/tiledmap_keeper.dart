import '../brokers/broker.dart';
import '../plan2d.dart';
import '../quant.dart';
import 'keeper.dart';

abstract class TiledmapKeeper<T extends Quant, B extends Broker<dynamic>>
    extends Keeper<T, B> {
  TiledmapKeeper(super.broker);

  @override
  bool exists(String id) => broker.exists(id);
}

abstract class QuantTiledmapKeeper<T extends Quant, B extends Broker<dynamic>>
    extends TiledmapKeeper<T, B> {
  QuantTiledmapKeeper(super.broker);
}

class Plan2DIntTiledmapKeeper<B extends Broker<dynamic>>
    extends QuantTiledmapKeeper<Plan2D<int>, B> {
  Plan2DIntTiledmapKeeper(super.broker);

  @override
  Plan2D<int>? read(String id) {
    throw Exception('Not implemented');
  }

  @override
  void write(Plan2D<int> value) {
    throw Exception('Not implemented');
  }
}
