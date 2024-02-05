part of '../../../vast_world_share.dart';

/// Helper component with [value] always is `null`.
class NothingComponent extends AnyComponent {
  @override
  String get uid => '$componentUidPrefix-$suid';

  static const suid = '05165ba9-0156-463f-942d-71ffcc08d50c';

  @override
  dynamic get empty => null;

  @override
  JsonMap get valueAsJson => {'value': null};

  @override
  dynamic jsonAsValue(JsonMap json) => null;
}
