part of '../../../vast_world_share.dart';

//class TiledmapRenderComponent extends VComponent<RenderFn<TiledmapT>> {
class TiledmapRenderComponent extends RenderComponent<TiledmapT> {
  @override
  String get uid => '$componentUidPrefix-$suid';

  static const suid = '9757b46d-11d3-4280-844d-398c12684001';

  @override
  RenderFn<TiledmapT> get empty => nothingTiledmapTRender;

  @override
  JsonMap get valueAsJson => {};

  @override
  RenderFn<TiledmapT> jsonAsValue(JsonMap json) => throw UnimplementedError();
}
