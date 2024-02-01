part of '../../../vast_world_share.dart';

/// Helper component with [value] always is `null`.
class NothingComponent extends Component<dynamic> {
  @override
  String get uid => '05165ba9-0156-463f-942d-71ffcc08d50c';

  @override
  dynamic get empty => null;

  @override
  JsonMap get valueAsJson => {'value': null};

  @override
  dynamic jsonAsValue(JsonMap json) => null;
}
