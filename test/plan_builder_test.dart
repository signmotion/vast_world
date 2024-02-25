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
      final plan = constructNothingPlan(u, componentBuilder: componentBuilder);
      final base = plan.base;
      final b = NativePlanBuilder(u, componentBuilder);
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
      final plan = constructNothingPlan(u, componentBuilder: componentBuilder)
        ..setComponent(ClientWidgetRenderComponent());
      final base = plan.base;
      final b = ExtendedPlanBuilder(u, componentBuilder);
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
