import 'package:json_dart/json_dart.dart';
import 'package:vast_world/vast_world_share.dart';

import '../renders/nothing.dart';
import '../renders/widget/widget.dart';

class ClientWidgetRenderComponent extends RenderComponent<ClientWidgetT> {
  @override
  String get uid => '$componentUidPrefix-$suid';

  static const suid = 'f994681f-c622-4358-8a03-3dd93fe22f09';

  @override
  RenderFn<ClientWidgetT> get empty => clientNothingWidgetTRender;

  @override
  JsonMap get valueAsJson => {};

  @override
  RenderFn<ClientWidgetT> jsonAsValue(JsonMap json) =>
      clientNothingWidgetTRender;
}
