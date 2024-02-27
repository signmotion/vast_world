// ignore_for_file: avoid_dynamic_calls

import 'package:path/path.dart' as ph;
import 'package:test/test.dart';
import 'package:vast_world/vast_world_share.dart';

import 'helpers/construct.dart';
import 'helpers/construct_journeys.dart';
import 'helpers/helpers2d.dart';
import 'prepare_test_env.dart';

void main() {
  prepareTestEnv();

  group('AllJourneysPlan, keeper for tmx formats', () {
    final plan = constructedAerwynaJourneyFromRaw;

    test(
        'Write place_4_aerwyna_journey plan to TiledMap format'
        ' and check file structure', () {
      final outputPath = ph.join(
        'test',
        'output',
        'journeys',
        'aerwyna_journey_tmx',
        'place_4_aerwyna_journeys',
      );
      final keeper = constructKeeper(outputPath)..clear();

      // saving the root and exposed plans
      final planForKeep = plan.exposed.single.exposed[4] as Plan<Plan<dynamic>>;
      keeper.write(planForKeep, 1);

      checkFileStructurePlan(
        planForKeep,
        outputPath: outputPath,
        existsPicture: true,
        countExposed: 0,
        checkPathPresence: [],
        checkPathAbsence: ['rendered'],
        width: 1024,
        height: 1024,
        infinite: false,
        imageLayerName: 'picture',
        imageLayerImageSource: 'picture.png',
        countTileset: null,
        tilesetImageSources: [],
        objectGroupName: 'story',
        countObject: 1,
        objectGroupObjectsNames: ['text'],
      );
    });

    test(
        'Write place_0_aerwyna_journey plan to TiledMap format'
        ' and check file structure', () {
      final outputPath = ph.join(
        'test',
        'output',
        'journeys',
        'aerwyna_journey_tmx',
        'place_0_aerwyna_journeys',
      );
      final keeper = constructKeeper(outputPath)..clear();

      // saving the root and exposed plans
      final planForKeep = plan.exposed.single.exposed[0] as Plan<Plan<dynamic>>;
      keeper.write(planForKeep);

      checkFileStructurePlan(
        planForKeep,
        outputPath: outputPath,
        existsPicture: true,
        countExposed: 0,
        checkPathPresence: [],
        checkPathAbsence: ['rendered'],
        width: 1024,
        height: 1024,
        infinite: false,
        imageLayerName: 'picture',
        imageLayerImageSource: 'picture.png',
        countTileset: null,
        tilesetImageSources: [],
        objectGroupName: 'story',
        countObject: 1,
        objectGroupObjectsNames: ['text'],
      );
    });

    test(
        'Write aerwyna_journey plan to TiledMap format'
        ' and check file structure', () {
      final outputPath = ph.join(
        'test',
        'output',
        'journeys',
        'aerwyna_journey_tmx',
        'aerwyna_journeys',
      );
      final keeper = constructKeeper(outputPath)..clear();

      // saving the root and exposed plans
      final planForKeep = plan.exposed.single as Plan<Plan<dynamic>>;
      keeper.write(planForKeep);

      checkFileStructurePlan(
        planForKeep,
        outputPath: outputPath,
        existsPicture: false,
        countExposed: 5,
        checkPathPresence: [
          'rendered/image/place_4/data.png',
          'rendered/image/place_3/data.png',
          'rendered/image/place_2/data.png',
          'rendered/image/place_1/data.png',
          'rendered/image/place_0/data.png',
        ],
        checkPathAbsence: [],
        width: 0,
        height: 0,
        infinite: true,
        imageLayerName: null,
        imageLayerImageSource: null,
        countTileset: 5,
        tilesetImageSources: [
          'rendered/image/place_4/data.png',
          'rendered/image/place_3/data.png',
          'rendered/image/place_2/data.png',
          'rendered/image/place_1/data.png',
          'rendered/image/place_0/data.png',
        ],
        objectGroupName: 'exposed',
        countObject: 5,
        objectGroupObjectsNames: [
          'place_4',
          'place_3',
          'place_2',
          'place_1',
          'place_0',
        ],
      );
    });

    test(
        'Write all_journeys plan to TiledMap format'
        ' and check file structure', () {
      final outputPath = ph.join(
        'test',
        'output',
        'journeys',
        'aerwyna_journey_tmx',
        'journeys',
      );
      final keeper = constructKeeper(outputPath)..clear();

      // saving the root and exposed plans
      final planForKeep = plan;
      keeper.write(planForKeep);

      checkFileStructurePlan(
        planForKeep,
        outputPath: outputPath,
        existsPicture: false,
        countExposed: 1,
        checkPathPresence: ['rendered/image/aerwyna/data.png'],
        checkPathAbsence: [],
        width: 0,
        height: 0,
        infinite: true,
        imageLayerName: null,
        imageLayerImageSource: null,
        countTileset: 1,
        tilesetImageSources: ['rendered/image/aerwyna/data.png'],
        objectGroupName: 'exposed',
        countObject: 1,
        objectGroupObjectsNames: ['aerwyna'],
      );
    });
  });
}
