// ignore_for_file: inference_failure_on_function_invocation

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
      lore.addNew(all);
      expect(lore.count, 1);
      expect(lore.universes.single.inner.entities.length, lore.count);

      final aerwyna = constructJourneyPlan(
        u,
        hid: 'aerwyna',
        name: 'Aerwyna',
        greeting: 'greeting',
        description: 'description',
      );
      lore.addNew(aerwyna);
      expect(lore.count, 2);
      // doesn't add a plan with able HID
      lore.addNew(aerwyna);
      expect(lore.count, 2);
      expect(lore.universes.single.inner.entities.length, lore.count);
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
    lore.addNew(all);

    final aerwyna = constructJourneyPlan(
      u,
      hid: 'aerwyna',
      name: 'Aerwyna',
      greeting: 'greeting',
      description: 'description',
    );
    lore.addNew(aerwyna);

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

    /* TODO
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
        AbsolutePlan().u,
        hid: 'aerwyna',
        name: 'New Aerwyna',
        greeting: 'updated greeting',
        description: 'updated description',
      );
      expect(aerwyna.hid, aerwynaUpdated.hid);
      expect(aerwyna.uid, isNot(equals(aerwynaUpdated.uid)));
      lore.add(aerwyna);
      expect(lore.count, 1);
      {
        final p = lore['aerwyna']!;
        expect(p.hid, aerwynaUpdated.hid);
        expect(p.uid, aerwyna.uid);

        final actual = p.component<NameComponent>()!.value;
        final expected = aerwynaUpdated.component<NameComponent>()!.value;

        expect(p.component<NameComponent>()!.value,
            aerwynaUpdated.component<NameComponent>()!.value);
        expect(p.component<GreetingComponent>()!.value,
            aerwynaUpdated.component<GreetingComponent>()!.value);
        expect(p.component<DescriptionComponent>()!.value,
            aerwynaUpdated.component<DescriptionComponent>()!.value);
      }
    });
    */

    test('Update the components of plan', () {
      final lore = Lore();

      final aerwyna = constructJourneyPlan(
        u,
        hid: 'aerwyna',
        name: 'Aerwyna',
        greeting: 'greeting',
        description: 'description',
      );
      lore.addNew(aerwyna);
      expect(lore.count, 1);
      expect(lore.universes.single.inner.entities.length, lore.count);

      const newName = 'New Aerwyna';
      const newGreeting = 'new greeting';
      const newDescription = 'new description';
      lore.update(aerwyna.id, NameComponent.new, newName);
      lore.update(aerwyna.id, GreetingComponent.new, newGreeting);
      lore.update(aerwyna.id, DescriptionComponent.new, newDescription);

      expect(lore.count, 1);
      expect(lore.universes.single.inner.entities.length, lore.count);
      {
        final p = lore['aerwyna']!;
        expect(p.hid, aerwyna.hid);
        expect(p.uid, aerwyna.uid);

        expect(p.component<NameComponent>()!.value, newName);
        expect(p.component<GreetingComponent>()!.value, newGreeting);
        expect(p.component<DescriptionComponent>()!.value, newDescription);
      }
    });
  });

  group('Bind plans or Add exposed plan', () {
    final u = Universe();

    test('Bind 2 plans', () {
      final lore = Lore();

      final all = constructAllJourneysPlan(u);
      lore.addNew(all);

      final aerwyna = constructJourneyPlan(
        u,
        hid: 'aerwyna',
        name: 'Aerwyna',
        greeting: 'greeting',
        description: 'description',
      );
      lore.addNew(aerwyna);

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

  group('Construct a plan from components', () {
    final u = Universe();

    test('Add a new empty component', () {
      final plan = constructNothingPlan(u);
      expect(plan.get<NameComponent>(), isNull);
      plan.set(NameComponent.new);
      expect(plan.get<NameComponent>()?.value, '');
    });

    test('Add a new component with value', () {
      final plan = constructNothingPlan(u);
      plan.set(NameComponent.new, 'Aerwyna');
      expect(plan.get<NameComponent>()?.value, 'Aerwyna');
    });
  });
}
