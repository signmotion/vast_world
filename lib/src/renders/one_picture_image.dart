part of '../../vast_world.dart';

/// The render that uses [PictureComponent] to construct [rendered].
class OnePictureImageRender extends ImageRender<ImageRenderConfigure> {
  OnePictureImageRender(
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
}
