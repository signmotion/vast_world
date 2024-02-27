import 'package:test/test.dart';
import 'package:vast_world/vast_world_share.dart';

import 'helpers/construct_journeys.dart';
import 'helpers/helpers2d.dart';
import 'prepare_test_env.dart';

void main() {
  prepareTestEnv();

  group('AllJourneysPlan, check raw format', () {
    final allJourneys = constructedAerwynaJourneyFromRaw;
    final aerwynaJourney = allJourneys.exposed.single as Plan<Plan<dynamic>>;

    test('Check `allJourneys` created from raw', () {
      checkPlan(
        allJourneys,
        hid: 'all_journeys',
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
        hid: 'aerwyna',
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
      for (final exposed in aerwynaJourney.exposed) {
        checkPlan(
          exposed as Plan<Plan<dynamic>>,
          hid: exposed.hid,
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
      final su = aerwynaJourney.u.toJson();
      expect(su['entity_count'], 7);
      expect((su['entity_list'] as Iterable<dynamic>).length, 7);
      expect(su['system_count'], 0);
      expect((su['system_list'] as Iterable<dynamic>).length, 0);
    });
  });
}
