// ignore_for_file: inference_failure_on_function_invocation

import 'package:json_dart/json_dart.dart';
import 'package:test/test.dart';
import 'package:vast_world/vast_world_share.dart';

import 'plans/all_journeys.dart';
import 'plans/journey.dart';
import 'prepare_test_env.dart';

void main() {
  prepareTestEnv();

  group('Add plans', () {
    test('Add 2 unique plans', () {
      final u = Universe();
      final lore = Lore(componentBuilder: NativeComponentBuilder.new);
      expect(lore.count, 0);

      final all = constructAllJourneysPlan(u);
      lore.addNew(all);
      expect(lore.count, 1);
      expect(lore.countsInUniverses.single, lore.count);

      final aerwyna = constructJourneyPlan(
        u,
        hid: 'aerwyna',
        name: 'Aerwyna',
        greeting: 'greeting',
        description: 'description',
      );
      lore.addNew(aerwyna);
      expect(lore.count, 2);
      expect(lore.countsInUniverses.single, lore.count);
      {
        final p = lore['aerwyna']!;
        expect(aerwyna.hid, p.hid);
        expect(aerwyna.uid, p.uid);
      }

      expect(lore.universes, containsAll({u}));
    });

    test('Add 2 same plans', () {
      final u = Universe();
      final lore = Lore(componentBuilder: NativeComponentBuilder.new);
      expect(lore.count, 0);

      final all = constructAllJourneysPlan(u);
      // add a first
      lore.addNew(all);
      // attempt to add a second
      expect(() => lore.addNew(all), throwsA(isA<ExistsPlanError>()));
    });
  });

  group('Get plans', () {
    final u = Universe();
    final lore = Lore(componentBuilder: NativeComponentBuilder.new);

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

    test('Update the components of plan, set<>()', () {
      final u = Universe();
      final lore = Lore(componentBuilder: NativeComponentBuilder.new);

      final aerwyna = constructJourneyPlan(
        u,
        hid: 'aerwyna',
        name: 'Aerwyna',
        greeting: 'greeting',
        description: 'description',
      );
      lore.addNew(aerwyna);
      expect(lore.count, 1);
      expect(lore.countsInUniverses.single, lore.count);

      const newName = 'New Aerwyna';
      lore.update(aerwyna.id, NameComponent.new, newName);

      const newGreeting = 'new greeting';
      lore.update(aerwyna.id, GreetingComponent.new, newGreeting);

      const newDescription = 'new description';
      lore.update(aerwyna.id, DescriptionComponent.new, newDescription);

      expect(lore.count, 1);
      expect(lore.countsInUniverses.single, lore.count);
      {
        final p = lore['aerwyna']!;
        expect(p.hid, aerwyna.hid);
        expect(p.components.length, 5, reason: p.components.sjson);
        expect(p.uid, aerwyna.uid);

        expect(p.component<NameComponent>()!.value, newName);
        expect(p.component<GreetingComponent>()!.value, newGreeting);
        expect(p.component<DescriptionComponent>()!.value, newDescription);
      }
    });

    test('Update the components of nothing plan, updateComponent()', () {
      final u = Universe();
      const componentBuilder = NativeComponentBuilder.new;
      final lore = Lore(componentBuilder: componentBuilder);

      final nothing =
          constructNothingPlan(u, componentBuilder: componentBuilder);
      lore.addNew(nothing);
      // always have [IdComponent]
      expect(nothing.components.length, 1, reason: nothing.components.sjson);

      final newNameComponent = NameComponent()..init('Aerwyna');
      lore.updateComponent(nothing.id, newNameComponent);
      expect(nothing.components.length, 2, reason: nothing.components.sjson);

      final newGreetingComponent = GreetingComponent()..init('greeting');
      lore.updateComponent(nothing.id, newGreetingComponent);
      expect(nothing.components.length, 3, reason: nothing.components.sjson);

      // first update: component absents
      final newDescriptionComponent1 = DescriptionComponent()
        ..init('description 1');
      lore.updateComponent(nothing.id, newDescriptionComponent1);
      expect(nothing.components.length, 4, reason: nothing.components.sjson);

      // second update: component presents
      final newDescriptionComponent2 = DescriptionComponent()
        ..init('description 2');
      lore.updateComponent(nothing.id, newDescriptionComponent2);
      expect(nothing.components.length, 4, reason: nothing.components.sjson);

      expect(lore.count, 1);
      expect(lore.countsInUniverses.single, lore.count);
      {
        final p = lore[nothing.id]!;
        expect(p.components.length, 4, reason: p.components.sjson);

        expect(
          p.component<NameComponent>()!.value,
          newNameComponent.value,
        );
        expect(
          p.component<GreetingComponent>()!.value,
          newGreetingComponent.value,
        );
        expect(
          p.component<DescriptionComponent>()!.value,
          newDescriptionComponent2.value,
        );
      }
    });
  });

  group('Bind plans or Add exposed plan', () {
    test('Bind 2 plans', () {
      final u = Universe();
      final lore = Lore(componentBuilder: NativeComponentBuilder.new);

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
      expect(lore.countsInUniverses.single, lore.count);

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
