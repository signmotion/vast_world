import 'package:dart_helpers/dart_helpers.dart';
import 'package:test/test.dart';
import 'package:vast_world/vast_world.dart';

import 'prepare_test_env.dart';

void main() {
  prepareTestEnv();

  group('Influence to Lore', () {
    const influencer = LoreInfluencer();

    test('Change a value', () {
      final u = Universe();
      final lore = Lore();

      final plan = constructNothingPlan(u);
      // always have [IdComponent]
      expect(plan.components.length, 1, reason: plan.components.sjson);
      expect(plan.get<NameComponent>(), isNull);

      lore.addNew(plan);

      // add new component
      {
        final act = ChangeValueAct(
          planId: plan.id,
          initializedComponents: [
            NameComponent()..init('Aerwyna'),
          ],
        );
        influencer.processing(lore, act);
        final p = lore[plan.id]!;
        expect(p.components.length, 2, reason: p.components.sjson);
        expect(p.getValue<NameComponent>(), 'Aerwyna');
      }

      // update component
      {
        final act = ChangeValueAct(
          planId: plan.id,
          initializedComponents: [
            NameComponent()..init('New Aerwyna'),
          ],
        );
        influencer.processing(lore, act);
        final p = lore[plan.id]!;
        expect(p.components.length, 2, reason: p.components.sjson);
        expect(p.getValue<NameComponent>(), 'New Aerwyna');
      }
    });
  });
}
