import 'package:dart_helpers/dart_helpers.dart';
import 'package:json_dart/json_dart.dart';
import 'package:oxygen/oxygen.dart' as oxygen;
import 'package:vast_world/vast_world_share.dart';

import 'widget_render.dart';

class ClientomponentBuilder extends NativeComponentBuilder {
  const ClientomponentBuilder();

  @override
  List<TBuilder<AnyComponent>> get extendedBuilders => [
        ClientWidgetRenderComponent.new,
      ];

  @override
  R? extendedRunForComponent<R>(
    String componentUid, {
    required RunComponentBuilderFn<R> run,
    Universe? u,
    oxygen.Entity? entity,
    JsonMap? jsonValue,
  }) {
    // by analogy with [runForComponent]
    final uid = componentUid;

    /// a number of components will be checked
    var count = 0;

    ++count;
    {
      const b = ClientWidgetRenderComponent.new;
      if (b().uid == uid) {
        return run(
          b,
          u: u,
          entity: entity,
          value: jsonValue == null ? null : b().jsonAsValue(jsonValue),
        );
      }
    }

    ae(count == extendedBuilders.length,
        'Inconsistent list of extended components.');

    return null;
  }
}
