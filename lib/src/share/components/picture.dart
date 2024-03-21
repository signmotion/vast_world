part of '../../../vast_world_share.dart';

class PictureComponent extends Component<Image?> {
  @override
  String get uid => '$componentUidPrefix-$suid';

  static const suid = 'e08d85f0-71e3-4964-abcd-a92a17ba22fc';

  @override
  Image? get empty => null;

  Image? get image => value;

  int get width => image?.width ?? 0;

  int get height => image?.height ?? 0;

  @override
  JsonMap get valueAsJson => {
        'width': width,
        'height': height,
        'bytes': image?.data?.getBytes().toList() ?? const <int>[],
      };

  @override
  Image jsonAsValue(JsonMap json) => switch (json) {
        {'width': int width, 'height': int height, 'bytes': List<int> bytes} =>
          Image.fromBytes(
            width: width,
            height: height,
            bytes: Uint8List.fromList(bytes).buffer,
          ),
        _ => throw IllegalArgumentError('json', json.sjson, StackTrace.current),
      };
}
