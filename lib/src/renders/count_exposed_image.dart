part of '../../vast_world.dart';

/// The render that calculates [exposed] into [watched] and drawing count
/// into the [rendered].
class CountExposedImageRender extends ImageRender<ImageRenderConfigure> {
  CountExposedImageRender(
    super.spectator,
    super.watched, {
    super.configure = const ImageRenderConfigure(),
  });

  @override
  ImageRenderedData get rendered {
    var image = Image(
      width: cfg.defaultWidth,
      height: cfg.defaultHeight,
    );
    final color = ColorRgba8(255, 255, 255, 255);
    const spaced = 48;

    void draw(String s, int q) => image = drawString(
          image,
          s,
          font: arial48,
          color: color,
          y: image.height ~/ 2 + q * spaced,
        );

    final count = watched.impactsOnPlans.length;
    draw("'${spectator.id}'", -3);
    draw("'${watched.id}'", -1);
    draw('$count', 2);

    return ImageRenderedData(spectator.id, watched.id, data: image);
  }
}
