import 'package:json_dart/json_dart.dart';
import 'package:test/test.dart';
import 'package:vast_world/vast_world.dart';

import '../prepare_test_env.dart';

void main() async {
  prepareTestEnv();

  final ma = constructServerLive();

  group('processing Act to Lore', () {
    setUp(() {
      expect(ma.state.lores, isEmpty);
    });

    test('AddPlanAct without components', () async {
      final session = genSessionUid;
      const planId = 'aerwyna';
      final act = AddPlanAct(spectatorId: '', planId: planId);
      ma.processingActOnLoreSession(session: session, actBase: act.base);

      expect(ma.state.lores.length, 1, reason: ma.state.lores.sjson);
      final lore = ma.state.lores[session]!;
      expect(lore.plans.length, 1, reason: lore.plans.sjson);
      final plan = lore.plans[planId]!;
      expect(plan.hid, planId);
      expect(plan.isCorrectHid, isTrue, reason: plan.hid);
      expect(plan.isCorrectUid, isTrue, reason: plan.uid);
      // always have IdComponent
      expect(plan.components.length, 1, reason: plan.components.sjson);
      expect(plan.getValue<IdComponent, IdT>(), (hid: planId, uid: plan.uid));
    });
  });
}
