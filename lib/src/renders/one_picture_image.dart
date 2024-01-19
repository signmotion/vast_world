part of '../../vast_world.dart';

Render<Image, ImageRenderedData, ImageRenderConfigure> onePictureImageRender(
  Plan<dynamic> spectator,
  Plan<dynamic> watched, {
  required ImageRenderConfigure configure,
}) =>
    Render(
      spectator,
      watched,
      render: _onePictureImageRender,
      defaults: defaultImage(configure),
      configure: configure,
    );

Image _onePictureImageRender(
  Plan<dynamic> spectator,
  Plan<dynamic> watched,
  ImageRenderConfigure configure,
) {
  final picture = watched.get<PictureComponent>();
  final defaults = defaultImage(configure);
  var image = picture?.image ?? defaults;
  final w = image.width.clamp(configure.minWidth, configure.maxWidth);
  final h = image.height.clamp(configure.minHeight, configure.maxHeight);
  final size = fitSize(
    Vector2(image.width.toDouble(), image.height.toDouble()),
    Vector2(w.toDouble(), h.toDouble()),
  );

  image = copyResize(
    image,
    width: size.x.toInt(),
    height: size.y.toInt(),
    maintainAspect: true,
    interpolation: Interpolation.cubic,
  );

  //image = grayscale(image);
  image = sepia(image);

  return image;
}
