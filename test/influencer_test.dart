import 'package:json_dart/json_dart.dart';
import 'package:test/test.dart';
import 'package:vast_world/vast_world_share.dart';

import 'client_classes/components/component_builder.dart';
import 'client_classes/components/widget_render.dart';
import 'client_classes/plans/plan_builder.dart';
import 'client_classes/renders/widget/all_journeys.dart';
import 'prepare_test_env.dart';

void main() {
  prepareTestEnv();

  group('Influence to Lore', () {
    const planBuilder = NativePlanBuilder.new;
    const componentBuilder = NativeComponentBuilder.new;

    test('Add a new plan', () {
      final influencer = LoreInfluencer(
        u: Universe(),
        planBuilder: planBuilder,
        componentBuilder: componentBuilder,
      );
      final lore = Lore(componentBuilder: componentBuilder);
      expect(lore.plans, isEmpty);

      final act = AddPlanAct(
        planId: 'aerwyna',
        initializedComponents: [
          NameComponent()..init('Aerwyna'),
        ],
      );
      influencer.processing(lore, act);
      expect(lore.plans.length, 1, reason: lore.plans.sjson);

      final p = lore[act.planId!]!;
      expect(p.components.length, 2, reason: p.components.sjson);
      expect(p.getValue<IdComponent>(), (hid: p.hid, uid: p.uid));
      expect(p.getValue<NameComponent>(), 'Aerwyna');
    });

    test('Add an exists plan', () {
      final influencer = LoreInfluencer(
        u: Universe(),
        planBuilder: planBuilder,
        componentBuilder: componentBuilder,
      );
      final lore = Lore(componentBuilder: componentBuilder);
      expect(lore.plans, isEmpty);

      final act = AddPlanAct(planId: 'aerwyna');
      // add a first
      influencer.processing(lore, act);
      // attempt to add a second
      expect(
        () => influencer.processing(lore, act),
        throwsA(isA<AlreadyExistsPlanError>()),
      );
    });

    test('Change a value', () {
      final influencer = LoreInfluencer(
        u: Universe(),
        planBuilder: planBuilder,
        componentBuilder: componentBuilder,
      );
      final u = Universe();
      final lore = Lore(componentBuilder: componentBuilder);

      final plan = constructNothingPlan(u, componentBuilder: componentBuilder);
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
        influencer.processing(lore, act);
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
        influencer.processing(lore, act);
        final p = lore[plan.id]!;
        expect(p.components.length, 2, reason: p.components.sjson);
        expect(p.getValue<NameComponent>(), 'New Aerwyna');
      }
    });
  });

  group('Client & Server influencers', () {
    final clientUniverse = Universe();
    const clientPlanBuilder = ClientPlanBuilder.new;
    const clientComponentBuilder = ClientomponentBuilder.new;

    final serverUniverse = Universe();
    const serverPlanBuilder = NativePlanBuilder.new;
    const serverComponentBuilder = NativeComponentBuilder.new;

    test('Add a new plan', () {
      final clientInfluencer = LoreInfluencer(
        u: clientUniverse,
        planBuilder: clientPlanBuilder,
        componentBuilder: clientComponentBuilder,
      );
      final clientLore = Lore(componentBuilder: clientComponentBuilder);

      final serverInfluencer = LoreInfluencer(
        u: serverUniverse,
        planBuilder: serverPlanBuilder,
        componentBuilder: serverComponentBuilder,
      );
      final serverLore = Lore(componentBuilder: serverComponentBuilder);

      final clientWidgetRenderComponent = ClientWidgetRenderComponent()
        ..init(clientAllJourneysWidgetRender);
      final act = AddPlanAct(
        planId: 'aerwyna',
        initializedComponents: [
          // defined for server and client (native component)
          NameComponent()..init('Aerwyna'),
          // defined for client only
          clientWidgetRenderComponent,
        ],
      );

      // client side
      {
        clientInfluencer.processing(clientLore, act);
        expect(clientLore.plans.length, 1, reason: clientLore.plans.sjson);
        final p = clientLore[act.planId!]!;
        // expected: Id, Name and full-coded WidgetRender components
        expect(p.components.length, 3, reason: p.components.sjson);
        expect(p.getValue<ClientWidgetRenderComponent>(),
            clientAllJourneysWidgetRender);
      }

      // server side
      {
        serverInfluencer.processing(serverLore, act);
        expect(serverLore.plans.length, 1, reason: serverLore.plans.sjson);
        final p = serverLore[act.planId!]!;
        // expected: Id, Name and declared-only WidgetRender components
        expect(p.components.length, 3, reason: p.components.sjson);
        expect(
          p.getValue<UnimplementedComponent>(),
          (idUnimplemented: clientWidgetRenderComponent.id),
        );
      }
    });
  });
}
