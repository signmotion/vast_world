part of '../../../vast_world.dart';

//class TiledmapRenderComponent extends VComponent<RenderFn<TiledmapT>> {
class TiledmapRenderComponent extends RenderComponent<TiledmapT> {
  @override
  RenderFn<TiledmapT> get empty => nothingTiledmapTRender;
}
