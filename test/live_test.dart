import 'package:test/test.dart';
import 'package:vast_world/vast_world.dart';

import 'prepare_test_env.dart';

void main() {
  prepareTestEnv();

  group('Live', () {
    final u = Universe();

    test('Add plan', () {
      final live = Live();
      expect(live.count, 0);

      final all = AllJourneysPlan(u);
      live.add(all);
      expect(live.count, 1);

      final aerwyna = JourneyPlan(
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

      expect(live.universes, containsAll([u]));
    });

    test('Update plan', () {
      final live = Live();

      final aerwyna = JourneyPlan(
        u,
        hid: 'aerwyna',
        name: 'Aerwyna',
        greeting: 'greeting',
        description: 'description',
      );
      live.add(aerwyna);
      expect(live.count, 1);

      final aerwynaUpdated = JourneyPlan(
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
}
