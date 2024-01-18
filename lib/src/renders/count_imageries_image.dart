part of '../../vast_world.dart';

/// The render that calculates [exposed] into [watched] and drawing count
/// into the [rendered].
class CountExposedImageRender extends ImageRender<ImageRenderConfigure> {
  CountExposedImageRender(
    super.spectator,
    super.watched, {
    super.configure = const ImageRenderConfigure(),
  });

  /// Just use resized [PictureComponent] or [defaults];
  @override
  ImageRenderedData get rendered {
    final image = Image(
      width: cfg.defaultWidth,
      height: cfg.defaultHeight,
    );
    drawString(
      image,
      '${watched.impactsOnPlans.length}',
      font: arial48,
      color: ColorRgba8(255, 255, 255, 255),
    );

    final r = copyResize(image, width: 12, height: 12);

    return ImageRenderedData(spectator.id, watched.id, data: r);
  }
}
