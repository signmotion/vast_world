import 'package:astronomical_measurements/astronomical_measurements.dart';
import 'package:vast_world/vast_world.dart';
import 'package:test/test.dart';

import 'prepare_test_env.dart';

void main() {
  prepareTestEnv();

  group('Construct Plan2D for planet and save it to TiledMap format', () {
    // select the radius of the planet according to the size of the
    // existing image of the planet map
    // 1 cell ~= 50 km
    const scale = 50;
    final (rx, ry) = size2DToCircleRadius(870, 680, scale: scale);
    // with this image size and world scale we have:
    //  rx = 6923
    //  ry = 5411
    var plan = Plan2D<int>.planet(
      radiusX: Unit.kilometre(rx),
      radiusY: Unit.kilometre(ry),
      scale: scale,
      innerDataDefaultValue: 12,
      outerDataDefaultValue: 0,
    );

    const circumferenceX = 870;
    const circumferenceY = 680;

    // fill the plan
    // path to data
    // add a background to plan
    plan += Background('test/data/planet_a_raw/bg.png');
    // insert an imagery (projection of other plan) to plan
    const position = (circumferenceX ~/ 2, circumferenceY ~/ 2);
    final width = Unit.kilometre(1100);
    plan += PictureImagery(
      'test/data/planet_a_raw/ri/bg.png',
      position: position,
      // the height will be calculated in proportion to the image size
      width: width,
    );

    test('Check', () {
      expect(plan.width, circumferenceX);
      expect(plan.height, circumferenceY);
      expect(plan.square, circumferenceX * circumferenceY);

      expect(plan.background!.npath, 'test/data/planet_a_raw/bg.png');
      expect(plan.background!.image, isNotNull);

      expect(plan.imageries.length, 1);
      final imagery = plan.imageries.single as PictureImagery;
      expect(imagery.npath, 'test/data/planet_a_raw/ri/bg.png');
      expect(imagery.image, isNotNull);
      expect(imagery.position, position);
      expect(imagery.width, width);
      // calculated by [width] and image size
      expect(imagery.height.floor(), Unit.kilometre(780));
    });

    test('Export and check', () {
      // TODO
    });
  });
}
