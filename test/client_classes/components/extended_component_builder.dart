import 'package:dart_helpers/dart_helpers.dart';
import 'package:json_dart/json_dart.dart';
import 'package:oxygen/oxygen.dart' as oxygen;
import 'package:vast_world/vast_world_share.dart';

import 'widget_render.dart';

class ExtendedComponentBuilder extends NativeComponentBuilder {
  const ExtendedComponentBuilder();

  @override
  List<TAnyComponentBuilder> get extendedBuilders => [
        ClientWidgetRenderComponent.new,
      ];

  @override
  R? extendedRunForComponent<R>(
    String componentId, {
    required RunComponentBuilderFn<R> run,
    Universe? u,
    oxygen.Entity? entity,
    JsonMap? jsonValue,
  }) {
    // by analogy with [runForComponent]
    final id = componentId;

    /// a number of components will be checked
    var count = 0;

    ++count;
    {
      const b = ClientWidgetRenderComponent.new;
      if (b().same(id)) {
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
