import 'package:test/test.dart';
import 'package:vast_world/vast_world_share.dart';

import 'helpers/helpers2d.dart';
import 'prepare_test_env.dart';

void main() {
  prepareTestEnv();

  const componentBuilder = NativeComponentBuilder.new;

  group('Constructing a plan from PlanBase with NativePlanBuilder', () {
    test('Empty plan', () {
      final u = Universe();
      final plan = constructNothingPlan(u, componentBuilder: componentBuilder);
      final base = plan.base;
      final b = NativePlanBuilder(u, NativeComponentBuilder.new);
      final constructed = b.fromBase(base);
      checkPlan(
        constructed,
        hid: '',
        componentIds: [IdComponent().id],
        exposedIds: [],
      );
    });
  });
}
