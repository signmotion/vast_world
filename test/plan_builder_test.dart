import 'package:test/test.dart';
import 'package:vast_world/vast_world.dart';

import 'helpers/helpers2d.dart';
import 'prepare_test_env.dart';

void main() {
  prepareTestEnv();

  group('Constructing a plan from PlanBase', () {
    test('Empty plan', () {
      final u = Universe();
      final plan = constructNothingPlan(u);
      final base = plan.base;
      final constructed = PlanBuilder(u).fromBase(base);
      checkPlan(
        constructed,
        hid: '',
        componentIds: [IdComponent().id],
        exposedIds: [],
      );
    });
  });
}
