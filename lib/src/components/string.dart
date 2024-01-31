part of '../../vast_world.dart';

class StringComponent extends Component<String> {
  @override
  String get uid => '51178a38-8a73-4c8d-a9cf-92fa382411d5';

  @override
  String get empty => '';

  @override
  JsonMap get valueAsJson => {'value': value};

  @override
  String jsonAsValue(JsonMap json) => switch (json) {
        {'value': String? value} => value ?? '',
        _ => throw ArgumentError(json.sjson),
      };
}
