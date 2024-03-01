import 'package:test/test.dart';
import 'package:vast_world/vast_world_share.dart';

import 'helpers/construct_journeys.dart';
import 'helpers/helpers2d.dart';
import 'prepare_test_env.dart';

void main() {
  prepareTestEnv();

  group('AllJourneysPlan, check raw format', () {
    final u = Universe();
    final lore = Lore(u, componentBuilder: NativeComponentBuilder.new);

    final allJourneys = constructedAerwynaJourneyFromRaw(lore);
    final aerwynaJourney = lore[allJourneys.exposedIds.single]!;

    test('Check `allJourneys` created from raw', () {
      checkPlan(
        allJourneys,
        hid: allJourneys.id,
        componentIds: [
          IdComponent().id,
          TiledmapRenderComponent().id,
        ],
        exposedIds: ['aerwyna'],
      );
    });

    test('Check `aerwynaJourney` created from raw', () {
      checkPlan(
        aerwynaJourney,
        hid: aerwynaJourney.id,
        componentIds: [
          IdComponent().id,
          NameComponent().id,
          GreetingComponent().id,
          DescriptionComponent().id,
          TiledmapRenderComponent().id,
        ],
        exposedIds: ['place_0', 'place_1', 'place_2', 'place_3', 'place_4'],
      );
    });

    test('Check places of `aerwynaJourney` created from raw', () {
      for (final exposedId in aerwynaJourney.exposedIds) {
        final exposed = lore[exposedId]!;
        checkPlan(
          exposed,
          hid: exposed.id,
          componentIds: [
            IdComponent().id,
            PictureComponent().id,
            StoryComponent().id,
            TiledmapRenderComponent().id,
          ],
          exposedIds: [],
        );
      }
    });

    test('Check Universe created from raw', () {
      final su = lore.u.toJson();
      expect(su['entity_count'], 7);
      expect((su['entity_list'] as Iterable<dynamic>).length, 7);
      expect(su['system_count'], 0);
      expect((su['system_list'] as Iterable<dynamic>).length, 0);
    });
  });
}
