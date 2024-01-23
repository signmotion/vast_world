import 'package:test/test.dart';
import 'package:vast_world/vast_world.dart';

import 'prepare_test_env.dart';

void main() {
  prepareTestEnv();

  group('Add empty plans', () {
    final u = Universe();

    test('Add 2 plans', () {
      final lore = Lore();
      expect(lore.count, 0);

      final all = constructAllJourneysPlan(u);
      lore.add(all);
      expect(lore.count, 1);

      final aerwyna = constructJourneyPlan(
        u,
        hid: 'aerwyna',
        name: 'Aerwyna',
        greeting: 'greeting',
        description: 'description',
      );
      lore.add(aerwyna);
      expect(lore.count, 2);
      // doesn't add a plan with able HID
      lore.add(aerwyna);
      expect(lore.count, 2);
      {
        final p = lore['aerwyna']!;
        expect(aerwyna.hid, p.hid);
        expect(aerwyna.uid, p.uid);
      }

      expect(lore.universes, containsAll({u}));
    });
  });

  group('Get plans', () {
    final u = Universe();
    final lore = Lore();

    final all = constructAllJourneysPlan(u);
    lore.add(all);

    final aerwyna = constructJourneyPlan(
      u,
      hid: 'aerwyna',
      name: 'Aerwyna',
      greeting: 'greeting',
      description: 'description',
    );
    lore.add(aerwyna);

    test('Get a plan by HID and UID', () {
      final a = lore[aerwyna.hid];
      final b = lore[aerwyna.uid];
      final c = lore[aerwyna.id];
      expect(a, b);
      expect(a, c);
    });
  });

  group('Update plans', () {
    final u = Universe();

    test('Update a whole empty plan', () {
      final lore = Lore();

      final aerwyna = constructJourneyPlan(
        u,
        hid: 'aerwyna',
        name: 'Aerwyna',
        greeting: 'greeting',
        description: 'description',
      );
      lore.add(aerwyna);
      expect(lore.count, 1);

      final aerwynaUpdated = constructJourneyPlan(
        u,
        hid: 'aerwyna',
        name: 'Aerwyna Updated',
        greeting: 'greeting updated',
        description: 'description updated',
      );
      expect(aerwyna.hid, aerwynaUpdated.hid);
      expect(aerwyna.uid, isNot(equals(aerwynaUpdated.uid)));
      lore.add(aerwyna);
      expect(lore.count, 1);
      {
        final p = lore['aerwyna']!;
        expect(aerwynaUpdated.hid, p.hid);
        expect(aerwyna.uid, p.uid);
        expect(aerwynaUpdated.component<NameComponent>()!.value,
            p.component<NameComponent>()!.value);
        expect(aerwynaUpdated.component<GreetingComponent>()!.value,
            p.component<GreetingComponent>()!.value);
        expect(aerwynaUpdated.component<DescriptionComponent>()!.value,
            p.component<DescriptionComponent>()!.value);
      }
    });
  });

  group('Bind plans or Add exposed plan', () {
    final u = Universe();

    test('Bind 2 plans', () {
      final lore = Lore();

      final all = constructAllJourneysPlan(u);
      lore.add(all);

      final aerwyna = constructJourneyPlan(
        u,
        hid: 'aerwyna',
        name: 'Aerwyna',
        greeting: 'greeting',
        description: 'description',
      );
      lore.add(aerwyna);

      {
        final exposed = lore[all.id]!.exposed as List<Plan<dynamic>>;
        expect(exposed, isEmpty);
      }
      {
        lore.bind(all.id, aerwyna.id);
        final exposed = lore[all.id]!.exposed as List<Plan<dynamic>>;
        expect(exposed, isNotEmpty);
        final e = exposed.single;
        expect(e.hid, aerwyna.hid);
        expect(e.uid, aerwyna.uid);
      }
    });
  });
}
