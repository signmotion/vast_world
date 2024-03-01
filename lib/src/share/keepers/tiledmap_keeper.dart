part of '../../../vast_world_share.dart';

abstract class TiledmapKeeper<
    Q extends Quant,
    ImgB extends Broker<dynamic, dynamic>,
    TxtB extends Broker<dynamic, dynamic>,
    XmlB extends Broker<dynamic, dynamic>> extends Keeper<Q, ImgB, TxtB, XmlB> {
  TiledmapKeeper({
    required super.imageBroker,
    required super.textBroker,
    required super.xmlBroker,
    super.readOnly = true,
  });
}

/// For define typed [Keeper] we can use inheritance or this syntax:
/// ```
/// typedef Keeper = PlanTiledmapKeeper<ImageFilesystemBroker, TextFilesystemBroker>;
/// ```
class PlanTiledmapKeeper<
        P extends Plan<Plan<dynamic>>,
        ImgB extends Broker<dynamic, dynamic>,
        TxtB extends Broker<dynamic, dynamic>,
        XmlB extends Broker<dynamic, dynamic>>
    extends TiledmapKeeper<P, ImgB, TxtB, XmlB> {
  PlanTiledmapKeeper({
    required super.imageBroker,
    required super.textBroker,
    required super.xmlBroker,
    super.readOnly = true,
  });

  @override
  P? read(String id, [int depth = Keeper.maxReadPlanDepth]) {
    super.read(id, depth);

    throw UnimplementedError();
  }

  @override
  void write(
    Quant value,
    Lore lore, [
    int depth = Keeper.maxWritePlanDepth,
  ]) {
    super.write(value, lore, depth);

    _writePlan(value as Plan<Plan<dynamic>>, lore, depth);
  }

  void _writePlan(
    Plan<Plan<dynamic>> plan,
    Lore lore, [
    int depth = Keeper.maxWritePlanDepth,
  ]) {
    final renderComponent = plan.get<TiledmapRenderComponent>();
    ae(
        renderComponent != null,
        'The plan `${plan.id}` should contains `TiledmapRenderComponent`'
        ' for transform the plan to Tiledmap representation.'
        ' Found: ${plan.componentsBuilders.map((b) => b().runtimeType)}');

    final r = renderComponent!.render(AbsolutePlan(), plan, lore);

    xmlBroker.write(r.fileXml.pathToFile, r.fileXml.content);

    for (final fm in r.fileImages) {
      imageBroker.write(fm.pathToFile, fm.content);
    }

    // TODO
    // // save the exposed as plans
    // for (final exposed in plan.exposed) {
    //   _writePlan(exposed as Plan<Plan<dynamic>>, depth - 1, prefix);
    // }
  }
}
