import 'package:id_gen/id_gen_tests.dart';
import 'package:test/test.dart';
import 'package:vast_world/vast_world.dart';

import '../prepare_test_env.dart';

void main() async {
  prepareTestEnv();

  final ma = serverLive;

  group('processing Act to Lore', () {
    setUp(() {
      expect(ma.state.lores, isEmpty);
    });

    test('AddPlanAct without components', () async {
      final session = genSessionUid;
      const planId = 'aerwyna';
      final act = AddPlanAct(planId: planId);
      ma.processingActOnLoreSession(session: session, actBase: act.base);

      expect(ma.state.lores.length, 1, reason: '${ma.state.lores}');
      final lore = ma.state.lores[session]!;
      expect(lore.plans.length, 1, reason: '${lore.plans}');
      final plan = lore.plans[planId]!;
      expect(plan.hid, planId);
      expect(plan.isCorrectHid, isTrue, reason: plan.hid);
      expect(plan.isCorrectUid, isTrue, reason: plan.uid);
      // always have IdComponent
      expect(plan.components.length, 1, reason: '${plan.components}');
      expect(plan.getValue<IdComponent>(), (hid: planId, plan.uid));
    });
  });
}
