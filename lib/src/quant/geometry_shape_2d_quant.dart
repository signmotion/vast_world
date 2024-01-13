part of '../../vast_world.dart';

// ignore: must_be_immutable
abstract class GeometryShape2DQuant extends Quant
    with HasGeometry2DMix, HasShape2DMix {
  GeometryShape2DQuant(
    super.pathPrefix,
    super.hid, {
    super.uid,
    required (int, int) axisPosition,
    required Unit realWidth,
    required Unit realHeight,
    required Anchor2D anchor,
    required AxisType axisType,
    required num scale,
    required Shape2D shape,
    this.wantFadeBackground = false,
  })  : assert(realWidth > 0),
        assert(realHeight > 0),
        assert(anchor == HasGeometry2DMix.defaultAnchor2D,
            'Not implemented others.'),
        assert(scale > 0),
        assert(realWidth.type == realHeight.type,
            'Width and height should be same measurements.') {
    this.axisPosition = axisPosition;

    this.realWidth = realWidth;
    this.realHeight = realHeight;

    this.anchor = anchor;
    this.axisType = axisType;

    axisWidth = (this.realWidth / scale).roundIntValue();
    axisHeight = (this.realHeight / scale).roundIntValue();

    this.shape = shape;

    if (wantFadeBackground) {
      fadeBackground();
    }
  }

  final bool wantFadeBackground;

  int index(int k, int l) => k + l * axisWidth;

  /// Darken the pixels outside the [shape].
  void fadeBackground() {
    print(background.image!);
    assert(axisWidth == background.image!.width);
    assert(axisHeight == background.image!.height);

    if (shape is InfinityShape) {
      // skip: the rectangle sizes == the images size
      return;
    }

    final out = shape.outside;

    /* very slow...
    // for each pixel by XY
    for (var y = 0; y < axisHeight; ++y) {
      stdout.write('  ${(y / axisHeight * 100).n1}%\r');
      for (var x = 0; x < axisWidth; ++x) {
        if (out(x, y)) {
          background.image!.setPixelRgba(x, y, 0x00, 0x00, 0x00, 0x00);
        }
      }
    }
    */

    final bgi = background.image!;
    if (!bgi.hasAlpha) {
      throw ArgumentError('Image should has an alpha channel.'
          ' Channels: ${bgi.numChannels}.');
    }

    final bytes = bgi.buffer.asByteData();
    final w = bgi.width;
    final h = bgi.height;
    print('$w $h ${bytes.lengthInBytes} ${bgi.numChannels}');
    var i = 0;
    for (var y = 0; y < h; ++y) {
      stdout.write('  ${(y / h * 100).n1}%\r');
      for (var x = 0; x < w; ++x) {
        if (out(x, y)) {
          bytes.setColorIntI(i, 0x00);
        }
        ++i;
      }
    }

    final image = Image.fromBytes(
        width: w,
        height: h,
        bytes: bytes.buffer,
        format: bgi.format,
        rowStride: bgi.rowStride,
        numChannels: bgi.numChannels,
        withPalette: bgi.hasPalette,
        palette: bgi.palette,
        exif: bgi.exif,
        iccp: bgi.iccProfile,
        textData: bgi.textData,
        loopCount: bgi.loopCount,
        frameType: bgi.frameType,
        backgroundColor: bgi.backgroundColor,
        frameDuration: bgi.frameDuration,
        frameIndex: bgi.frameIndex);
    background = Background.fromImage(background.path, image);

    // test
    final broker = ImageFilesystemBroker('test/output');
    broker.write('$hid.bg.png', image);
  }

  bool inside(int k, int l) => !outside(k, l);

  bool outside(int k, int l) => shape is InfinityShape
      ? k > axisUppers[0] ||
          l > axisUppers[1] ||
          k < axisLowers[0] ||
          l < axisLowers[1]
      : shape.outside(k, l);
}
