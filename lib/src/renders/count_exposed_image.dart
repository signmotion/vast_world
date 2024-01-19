part of '../../vast_world.dart';

Image countExposedImageRender(
  Plan<dynamic> spectator,
  Plan<dynamic> watched,
) {
  const configure = ImageRenderConfigure();

  var image = Image(
    width: configure.defaultWidth,
    height: configure.defaultHeight,
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

  return image;
}
