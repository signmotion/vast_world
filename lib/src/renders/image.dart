part of '../../vast_world.dart';

/// The base render an image of [watched] for [spectator].
abstract class ImageRender<C extends ImageRenderConfigure>
    extends Render<Image, ImageRenderedData, C> {
  ImageRender(
    super.spectator,
    super.watched, {
    required super.configure,
  });

  ImageRenderedData get defaults => ImageRenderedData(
        spectator.id,
        watched.id,
        data: Image(
          width: cfg.defaultWidth,
          height: cfg.defaultHeight,
        ),
      );
}

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
    super.watchedId, {
    required super.data,
  });
}
