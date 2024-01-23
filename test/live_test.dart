import 'package:test/test.dart';
import 'package:vast_world/vast_world.dart';

import 'prepare_test_env.dart';

void main() {
  prepareTestEnv();

  group('Add empty plans', () {
    final u = Universe();

    test('Add 2 plans', () {
      final live = Live();
      expect(live.count, 0);

      final all = constructAllJourneysPlan(u);
      live.add(all);
      expect(live.count, 1);

      final aerwyna = constructJourneyPlan(
        u,
        hid: 'aerwyna',
        name: 'Aerwyna',
        greeting: 'greeting',
        description: 'description',
      );
      live.add(aerwyna);
      expect(live.count, 2);
      // doesn't add a plan with able HID
      live.add(aerwyna);
      expect(live.count, 2);
      {
        final p = live['aerwyna']!;
        expect(aerwyna.hid, p.hid);
        expect(aerwyna.uid, p.uid);
      }

      expect(live.universes, containsAll({u}));
    });
  });

  group('Get plans', () {
    final u = Universe();
    final live = Live();

    final all = constructAllJourneysPlan(u);
    live.add(all);

    final aerwyna = constructJourneyPlan(
      u,
      hid: 'aerwyna',
      name: 'Aerwyna',
      greeting: 'greeting',
      description: 'description',
    );
    live.add(aerwyna);

    test('Get a plan by HID and UID', () {
      final a = live[aerwyna.hid];
      final b = live[aerwyna.uid];
      final c = live[aerwyna.id];
      expect(a, b);
      expect(a, c);
    });
  });

  group('Update plans', () {
    final u = Universe();

    test('Update a whole empty plan', () {
      final live = Live();

      final aerwyna = constructJourneyPlan(
        u,
        hid: 'aerwyna',
        name: 'Aerwyna',
        greeting: 'greeting',
        description: 'description',
      );
      live.add(aerwyna);
      expect(live.count, 1);

      final aerwynaUpdated = constructJourneyPlan(
        u,
        hid: 'aerwyna',
        name: 'Aerwyna Updated',
        greeting: 'greeting updated',
        description: 'description updated',
      );
      expect(aerwyna.hid, aerwynaUpdated.hid);
      expect(aerwyna.uid, isNot(equals(aerwynaUpdated.uid)));
      live.add(aerwyna);
      expect(live.count, 1);
      {
        final p = live['aerwyna']!;
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
      final live = Live();

      final all = constructAllJourneysPlan(u);
      live.add(all);

      final aerwyna = constructJourneyPlan(
        u,
        hid: 'aerwyna',
        name: 'Aerwyna',
        greeting: 'greeting',
        description: 'description',
      );
      live.add(aerwyna);

      {
        final exposed = live[all.id]!.exposed as List<Plan<dynamic>>;
        expect(exposed, isEmpty);
      }
      {
        live.bind(all.id, aerwyna.id);
        final exposed = live[all.id]!.exposed as List<Plan<dynamic>>;
        expect(exposed, isNotEmpty);
        final e = exposed.single;
        expect(e.hid, aerwyna.hid);
        expect(e.uid, aerwyna.uid);
      }
    });
  });
}
