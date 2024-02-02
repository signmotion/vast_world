import 'package:dart_helpers/dart_helpers.dart';
import 'package:test/test.dart';
import 'package:vast_world/vast_world_share.dart';

import 'prepare_test_env.dart';

void main() {
  prepareTestEnv();

  group('Influence to Lore', () {
    const influencer = LoreInfluencer();

    test('Add a new plan', () {
      final u = Universe();
      final lore = Lore();
      expect(lore.plans, isEmpty);

      final act = AddPlanAct(
        planId: 'aerwyna',
        initializedComponents: [
          NameComponent()..init('Aerwyna'),
        ],
      );
      influencer.processing(u, lore, act);
      expect(lore.plans.length, 1, reason: lore.plans.sjson);

      final p = lore[act.planId!]!;
      expect(p.components.length, 2, reason: p.components.sjson);
      expect(p.getValue<NameComponent>(), 'Aerwyna');
    });

    test('Add an exists plan', () {
      final u = Universe();
      final lore = Lore();
      expect(lore.plans, isEmpty);

      final act = AddPlanAct(planId: 'aerwyna');
      // add a first
      influencer.processing(u, lore, act);
      // attempt to add a second
      expect(
        () => influencer.processing(u, lore, act),
        throwsA(isA<AlreadyExistsPlanError>()),
      );
    });

    test('Change a value', () {
      final u = Universe();
      final lore = Lore();

      final plan = constructNothingPlan(u);
      // always have [IdComponent]
      expect(plan.components.length, 1, reason: plan.components.sjson);
      expect(plan.get<NameComponent>(), isNull);

      lore.addNew(plan);

      // add a new component
      {
        final act = ChangeValueAct(
          planId: plan.id,
          initializedComponents: [
            NameComponent()..init('Aerwyna'),
          ],
        );
        influencer.processing(u, lore, act);
        final p = lore[plan.id]!;
        expect(p.components.length, 2, reason: p.components.sjson);
        expect(p.getValue<NameComponent>(), 'Aerwyna');
      }

      // update the component
      {
        final act = ChangeValueAct(
          planId: plan.id,
          initializedComponents: [
            NameComponent()..init('New Aerwyna'),
          ],
        );
        influencer.processing(u, lore, act);
        final p = lore[plan.id]!;
        expect(p.components.length, 2, reason: p.components.sjson);
        expect(p.getValue<NameComponent>(), 'New Aerwyna');
      }
    });
  });
}
