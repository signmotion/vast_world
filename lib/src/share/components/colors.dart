part of '../../../vast_world_share.dart';

/// <color name, RGB as int>
/// Color name can be same as value.
/// See the project `UniColorName`, class [Palettes].
typedef ColorsT = Map<String, int>;

class ColorsComponent extends Component<ColorsT> {
  @override
  String get uid => '$componentUidPrefix-$suid';

  static const suid = '3c9ae143-7ad6-4f9d-a910-abdbd99476dd';

  @override
  ColorsT get empty => {};

  ColorsT get colors => value;

  int get count => colors.length;

  @override
  JsonMap get valueAsJson => {'value': value};

  @override
  ColorsT jsonAsValue(JsonMap json) => switch (json) {
        {'value': ColorsT? value} => value ?? {},
        _ => throw IllegalArgumentError('json', json.sjson, StackTrace.current),
      };
}
