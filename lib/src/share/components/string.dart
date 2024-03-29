part of '../../../vast_world_share.dart';

class StringComponent extends Component<String> {
  @override
  String get uid => '$componentUidPrefix-$suid';

  static const suid = '51178a38-8a73-4c8d-a9cf-92fa382411d5';

  @override
  String get empty => '';

  @override
  JsonMap get valueAsJson => {'value': value};

  @override
  String jsonAsValue(JsonMap json) => switch (json) {
        {'value': String? value} => value ?? '',
        _ => throw IllegalArgumentError('json', json.sjson, StackTrace.current),
      };
}
