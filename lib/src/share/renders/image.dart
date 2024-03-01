part of '../../../vast_world_share.dart';

class ImageRenderConfigure extends RenderConfigure {
  const ImageRenderConfigure({
    this.minWidth = 64,
    this.maxWidth = 512,
    this.minHeight = 64,
    this.maxHeight = 512,
    this.defaultWidth = 512,
    this.defaultHeight = 512,
  });

  final int minWidth;
  final int maxWidth;

  final int minHeight;
  final int maxHeight;

  final int defaultWidth;
  final int defaultHeight;
}

class ImageRenderedData extends RenderedData<Image> {
  const ImageRenderedData(
    super.spectatorId,
    super.watchedId,
    super.lore, {
    required super.data,
  });
}

Image defaultImage([
  ImageRenderConfigure configure = const ImageRenderConfigure(),
]) =>
    Image(
      width: configure.defaultWidth,
      height: configure.defaultHeight,
    );
