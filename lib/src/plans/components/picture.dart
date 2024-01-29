part of '../../../vast_world.dart';

class PictureComponent extends Component<Image> {
  @override
  String get uid => 'e08d85f0-71e3-4964-abcd-a92a17ba22fc';

  @override
  Image get empty => Image.empty();

  Image get image => value;

  int get width => image.width;

  int get height => image.height;

  @override
  JsonMap get valueAsJson => {
        'width': width,
        'height': height,
        'bytes': image.data!.getBytes(),
      };

  @override
  Image jsonAsValue(JsonMap json) => switch (json) {
        {'width': int width, 'height': int height, 'bytes': Uint8List bytes} =>
          Image.fromBytes(
            width: width,
            height: height,
            bytes: bytes.buffer,
          ),
        _ => throw ArgumentError(json),
      };
}
