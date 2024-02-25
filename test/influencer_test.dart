import 'package:json_dart/json_dart.dart';
import 'package:test/test.dart';
import 'package:vast_world/vast_world_share.dart';

import 'client_classes/components/extended_component_builder.dart';
import 'client_classes/components/widget_render.dart';
import 'client_classes/plans/extended_plan_builder.dart';
import 'client_classes/renders/widget/all_journeys.dart';
import 'client_classes/renders/widget/widget.dart';
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
        spectatorId: '',
        planId: 'aerwyna',
        initializedComponents: [
          NameComponent()..init('Aerwyna'),
        ],
      );
      influencer.processingOnServer(lore, act);
      expect(lore.plans.length, 1, reason: lore.plans.sjson);

      final p = lore[act.planId!]!;
      expect(p.components.length, 2, reason: p.components.sjson);
      expect(p.getValue<IdComponent, IdT>(), (hid: p.hid, uid: p.uid));
      expect(p.getValue<NameComponent, String>(), 'Aerwyna');
    });

    test('Add an exists plan', () {
      final influencer = LoreInfluencer(
        u: Universe(),
        planBuilder: planBuilder,
        componentBuilder: componentBuilder,
      );
      final lore = Lore(componentBuilder: componentBuilder);
      expect(lore.plans, isEmpty);

      final act = AddPlanAct(spectatorId: '', planId: 'aerwyna');
      // add a first
      influencer.processingOnServer(lore, act);
      // attempt to add a second
      expect(
        () => influencer.processingOnServer(lore, act),
        throwsA(isA<ExistsPlanError>()),
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
        influencer.processingOnServer(lore, act);
        final p = lore[plan.id]!;
        expect(p.components.length, 2, reason: p.components.sjson);
        expect(p.getValue<NameComponent, String>(), 'Aerwyna');
      }

      // update the component
      {
        final act = ChangeValueAct(
          planId: plan.id,
          initializedComponents: [
            NameComponent()..init('New Aerwyna'),
          ],
        );
        influencer.processingOnServer(lore, act);
        final p = lore[plan.id]!;
        expect(p.components.length, 2, reason: p.components.sjson);
        expect(p.getValue<NameComponent, String>(), 'New Aerwyna');
      }
    });
  });

  group('Client & Server influencers', () {
    final clientUniverse = Universe();
    const clientPlanBuilder = ExtendedPlanBuilder.new;
    const clientComponentBuilder = ExtendedComponentBuilder.new;

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
        spectatorId: '',
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
        clientInfluencer.processingOnServer(clientLore, act);
        expect(clientLore.plans.length, 1, reason: clientLore.plans.sjson);
        final p = clientLore[act.planId!]!;
        // expected: Id, Name and full-coded WidgetRender components
        expect(p.components.length, 3, reason: p.components.sjson);
        expect(
          p.getRender<ClientWidgetRenderComponent, ClientWidgetT>(),
          clientAllJourneysWidgetRender,
        );
      }

      // server side
      {
        serverInfluencer.processingOnServer(serverLore, act);
        expect(serverLore.plans.length, 1, reason: serverLore.plans.sjson);
        final p = serverLore[act.planId!]!;
        // expected: Id, Name and declared-only WidgetRender components
        expect(p.components.length, 3, reason: p.components.sjson);
        expect(
          p.getValue<UnimplementedComponent, UnimplementedT>(),
          (idUnimplemented: clientWidgetRenderComponent.id),
        );
      }
    });
  });
}
