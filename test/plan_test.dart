// ignore_for_file: inference_failure_on_function_invocation

import 'package:json_dart/json_dart.dart';
import 'package:test/test.dart';
import 'package:vast_world/vast_world_share.dart';

import 'plans/all_journeys.dart';
import 'plans/journey.dart';
import 'prepare_test_env.dart';

void main() {
  prepareTestEnv();

  const componentBuilder = NativeComponentBuilder.new;

  group('Construct a plan from components, set<>()', () {
    test('Add a new empty component', () {
      final u = Universe();
      final plan = constructNothingPlan(u, componentBuilder: componentBuilder);
      // always have [IdComponent]
      expect(plan.get<IdComponent>(), isNotNull);
      expect(plan.get<NameComponent>(), isNull);
      expect(plan.components.length, 1, reason: plan.components.sjson);

      plan.set(NameComponent.new);
      expect(plan.getValue<NameComponent, String>(), NameComponent().defaults);
      expect(plan.components.length, 2, reason: plan.components.sjson);
    });

    test('Add a new component with value', () {
      final u = Universe();
      final plan = constructNothingPlan(u, componentBuilder: componentBuilder);
      plan.set(NameComponent.new, 'Aerwyna');
      expect(plan.getValue<NameComponent, String>(), 'Aerwyna');
    });
  });

  group('Construct a plan from components, setComponent()', () {
    test('Add a new empty component', () {
      final u = Universe();
      final plan = constructNothingPlan(u, componentBuilder: componentBuilder);
      // always have [IdComponent]
      expect(plan.get<IdComponent>(), isNotNull);
      expect(plan.get<NameComponent>(), isNull);
      expect(plan.components.length, 1, reason: plan.components.sjson);

      plan.setComponent(NameComponent());
      expect(plan.getValue<NameComponent, String>(), NameComponent().defaults);
      expect(plan.components.length, 2, reason: plan.components.sjson);
    });

    test('Add a new component with value', () {
      final u = Universe();
      final plan = constructNothingPlan(u, componentBuilder: componentBuilder);
      plan.setComponent(NameComponent()..init('Aerwyna'));
      expect(plan.getValue<NameComponent, String>(), 'Aerwyna');
    });
  });

  group('Get components from plan', () {
    test('some inherited children', () {
      final u = Universe();
      final plan = constructJourneyPlan(
        u,
        hid: 'aerwyna',
        name: 'Aerwyna',
        greeting: 'greeting',
        description: 'description',
      );
      final inherited = plan.inheritedComponents<StringComponent>();
      expect(
          inherited.map((c) => c.runtimeType),
          containsAll([
            NameComponent(),
            GreetingComponent(),
            DescriptionComponent(),
          ].map((c) => c.runtimeType)));
    });

    test('last child', () {
      final u = Universe();
      final plan = constructJourneyPlan(
        u,
        hid: 'aerwyna',
        name: 'Aerwyna',
        greeting: 'greeting',
        description: 'description',
      );
      final inherited = plan.inheritedComponents<GreetingComponent>();
      expect(inherited.single.runtimeType, GreetingComponent().runtimeType);
    });
  });

  group('Update plans', () {
    test('Update the components of plan, set<>()', () {
      // see [lore_test]
    });

    test('Update the components of nothing plan, updateComponent()', () {
      // see [lore_test]
    });
  });

  group('Bind plans or Add exposed plan', () {
    test('Bind 2 plans', () {
      final u = Universe();

      final all = constructAllJourneysPlan(u);
      final aerwyna = constructJourneyPlan(
        u,
        hid: 'aerwyna',
        name: 'Aerwyna',
        greeting: 'greeting',
        description: 'description',
      );
      expect(all.exposed, isEmpty);

      all.addToExposed(aerwyna);
      expect(all.exposed.length, 1);
      final e = all.exposed.single as Plan<Plan<dynamic>>;
      expect(e.hid, aerwyna.hid);
      expect(e.uid, aerwyna.uid);
    });
  });
}
