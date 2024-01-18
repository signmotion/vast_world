part of '../../vast_world.dart';

/// The render that calculates [imageries] into [watched] and drawing count
/// into the [rendered].
class CountImageriesImageRender extends ImageRender<ImageRenderConfigure> {
  CountImageriesImageRender(
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
      '${watched.imageries.length}',
      font: arial48,
      color: ColorRgba8(255, 255, 255, 255),
    );

    return ImageRenderedData(spectator.id, watched.id, data: image);
  }
}
