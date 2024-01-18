import 'package:test/test.dart';

import 'helpers/constructed_journeys.dart';
import 'helpers/helpers2d.dart';
import 'prepare_test_env.dart';

void main() {
  prepareTestEnv();

  group('AllJourneysPlan, check raw format', () {
    final allJourneys = constructedAerwynaJourneyFromRaw;
    final aerwynaJourney = allJourneys.imageries.single;

    test('Check `allJourneys` created from raw', () {
      checkPlan(
        allJourneys,
        hid: 'all',
        imageryIds: ['aerwyna'],
      );
    });

    test('Check `aerwynaJourney` created from raw', () {
      checkPlan(
        aerwynaJourney,
        hid: 'aerwyna',
        imageryIds: ['place_0', 'place_1', 'place_2', 'place_3', 'place_4'],
      );
    });

    test('Check places of `aerwynaJourney` created from raw', () {
      for (final imagery in aerwynaJourney.imageries) {
        checkPlan(
          imagery,
          hid: imagery.hid,
          imageryIds: [],
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
