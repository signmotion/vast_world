part of '../../vast_world.dart';

/// A default render an image of [watched] for [spectator].
class ImageRender
    extends Render<Image, ImageRenderedData, ImageRenderConfigure> {
  ImageRender(
    super.spectator,
    super.watched, {
    super.configure = const ImageRenderConfigure(),
  });

  /// Just use resized [PictureComponent] or [defaults];
  @override
  ImageRenderedData get rendered {
    final picture = watched.innerEntity.get<PictureComponent>();
    final image = picture?.image ?? defaults.data;
    final w = amath.clamp(image.width, cfg.minWidth, cfg.maxWidth).toInt();
    final h = amath.clamp(image.height, cfg.minHeight, cfg.maxHeight).toInt();
    final size = fitSize(
      Vector2(image.width.toDouble(), image.height.toDouble()),
      Vector2(w.toDouble(), h.toDouble()),
    );

    final resized = copyResize(
      image,
      width: size.x.toInt(),
      height: size.y.toInt(),
      maintainAspect: true,
      interpolation: Interpolation.cubic,
    );

    return ImageRenderedData(spectator.id, watched.id, data: resized);
  }

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
