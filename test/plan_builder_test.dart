import 'package:test/test.dart';
import 'package:vast_world/vast_world_share.dart';

import 'client_classes/components/extended_component_builder.dart';
import 'client_classes/components/widget_render.dart';
import 'client_classes/plans/extended_plan_builder.dart';
import 'helpers/helpers2d.dart';
import 'prepare_test_env.dart';

void main() {
  prepareTestEnv();

  group('Constructing a plan from PlanBase with NativePlanBuilder', () {
    const componentBuilder = NativeComponentBuilder.new;

    test('Empty plan', () {
      final u = Universe();
      final lore = Lore(u, componentBuilder: componentBuilder);
      final plan = constructNothingPlanIntoLore(lore);

      final nu = Universe();
      final newLore = Lore(nu, componentBuilder: componentBuilder);
      final b = NativePlanBuilder(newLore);
      final base = plan.base;
      final constructed = b.fromBase(base);
      checkPlan(
        constructed,
        hid: '',
        componentIds: [IdComponent().id],
        exposedIds: [],
      );
    });
  });

  group('Constructing a plan from PlanBase with ExtendedPlanBuilder', () {
    const componentBuilder = ExtendedComponentBuilder.new;

    test('Plan with extended component', () {
      final u = Universe();
      final lore = Lore(u, componentBuilder: componentBuilder);
      final plan = constructNothingPlanIntoLore(lore)
        ..setComponent(ClientWidgetRenderComponent());

      final nu = Universe();
      final newLore = Lore(nu, componentBuilder: componentBuilder);
      final b = ExtendedPlanBuilder(newLore);
      final base = plan.base;
      final constructed = b.fromBase(base);
      checkPlan(
        constructed,
        hid: '',
        components: [IdComponent(), ClientWidgetRenderComponent()],
        exposedIds: [],
      );
    });
  });
}
