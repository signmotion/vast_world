// ignore_for_file: inference_failure_on_function_invocation

part of '../../vast_world.dart';

/// [render] Constructing a representation the [I] to this plan.
class Plan<I extends Plan<dynamic>> extends Quant {
  Plan(
    this.u, {
    super.hid = '',
    super.uid = '',
    RenderFn<Image>? imageRenderForExposed,
    RenderFn<XmlDocument>? xmlRenderForExposed,
    RenderFn<Image>? imageRenderForChildExposed,
    List<I>? impactsOnPlans,
  }) {
    // to fix error `UnmodifiableList`
    this.impactsOnPlans = impactsOnPlans ?? List<I>.empty(growable: true);

    u.registerComponent(IdComponent.new);
    u.registerComponent(DEPRECATED_ImageRenderForExposedComponent.new);
    u.registerComponent(DEPRECATED_XmlRenderComponent.new);
    u.registerComponent(DEPRECATED_ImageRenderForChildExposedComponent.new);

    // an one entity on each plan
    innerEntity = u.construct(id)
      ..add<IdComponent, IdT>((hid: hid, uid: uid))
      ..add<DEPRECATED_ImageRenderForExposedComponent, RenderFn<Image>?>(
          imageRenderForExposed)
      ..add<DEPRECATED_XmlRenderComponent, RenderFn<XmlDocument>?>(
          xmlRenderForExposed)
      ..add<DEPRECATED_ImageRenderForChildExposedComponent, RenderFn<Image>?>(
          imageRenderForChildExposed);
  }

  final Universe u;

  @protected
  late final Entity innerEntity;

  late final List<I> impactsOnPlans;

  /// Alias [impactsOnPlans].
  List<I> get exposed => impactsOnPlans;

  void addToImpacts(I plan) => impactsOnPlans.add(plan);

  T? get<T extends VComponent<dynamic>>() => innerEntity.get<T>();
}
