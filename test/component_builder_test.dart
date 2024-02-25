import 'package:test/test.dart';
import 'package:vast_world/vast_world_maia.dart';
import 'package:vast_world/vast_world_share.dart';

import 'client_classes/components/extended_component_builder.dart';
import 'client_classes/components/widget_render.dart';
import 'prepare_test_env.dart';

void main() {
  prepareTestEnv();

  group('Extended ComponentBuilder', () {
    const nativeBuilder = NativeComponentBuilder();
    const extendedBuilder = ExtendedComponentBuilder();

    test('Construct -> Keep as Unimplemented -> Restore from Unimplemented',
        () {
      final component = ClientWidgetRenderComponent();
      expect(component.uid, endsWith(ClientWidgetRenderComponent.suid));

      // native builder
      final nativeRestored = nativeBuilder.fromBase(component.base);
      expect(nativeRestored.hid, UnimplementedComponent().hid);
      expect(nativeRestored.uid, UnimplementedComponent().uid);
      final unimplemented = UnimplementedComponent()
        ..init((idUnimplemented: component.id));
      expect(nativeRestored, equals(unimplemented));

      // extended builder
      final extendedRestored = extendedBuilder.fromBase(component.base);
      expect(extendedRestored, equals(component));
    });
  });
}
