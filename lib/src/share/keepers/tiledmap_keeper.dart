part of '../../../vast_world_share.dart';

abstract class TiledmapKeeper<
    Q extends Quant,
    ImgB extends Broker<dynamic>,
    TxtB extends Broker<dynamic>,
    XmlB extends Broker<dynamic>> extends Keeper<Q, ImgB, TxtB, XmlB> {
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
    P extends Plan<dynamic>,
    ImgB extends Broker<dynamic>,
    TxtB extends Broker<dynamic>,
    XmlB extends Broker<dynamic>> extends TiledmapKeeper<P, ImgB, TxtB, XmlB> {
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
  void write(Quant value, [int depth = Keeper.maxWritePlanDepth]) {
    super.write(value, depth);

    _writePlan(value as Plan<dynamic>, depth);
  }

  void _writePlan(
    Plan<dynamic> plan, [
    int depth = Keeper.maxWritePlanDepth,
    String? pathPrefix,
  ]) {
    final renderComponent = plan.get<TiledmapRenderComponent>();
    ae(
        renderComponent != null,
        'The plan `${plan.id}` should contains `TiledmapRenderComponent`'
        ' for transform the plan to Tiledmap format.');

    final r = renderComponent!.render(AbsolutePlan(), plan);
    final pp = pathPrefix ?? '';

    xmlBroker.write(
      ph.join(pp, r.fileXml.pathToFile),
      r.fileXml.content,
    );

    for (final fm in r.fileImages) {
      imageBroker.write(
        ph.join(pp, fm.pathToFile),
        fm.content,
      );
    }

    // TODO
    // _writePlanXml(plan, pathPrefix);
    // _writePlanPictureComponent(plan, pathPrefix);

    // // ! keep all plans to the root; reason: 1 plan can links to some exposed,
    // // ! change them & take changes them
    // final prefix = pathPrefix;

    // // save the exposed as plans
    // for (final exposed in plan.impactsOnPlans) {
    //   _writePlan(exposed as Plan<dynamic>, depth - 1, prefix);
    // }
  }
}