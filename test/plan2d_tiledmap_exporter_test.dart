import 'package:astronomical_measurements/astronomical_measurements.dart';
import 'package:vast_world/vast_world.dart';
import 'package:test/test.dart';

import 'prepare_test_env.dart';

void main() {
  prepareTestEnv();

  group('Construct Plan2D for planet and save it to TiledMap format', () {
    // select the radius of the planet according to the size of the
    // existing image of the planet map
    const circumferenceX = 870;
    const circumferenceY = 680;
    // 1 cell ~= 50 km
    const scale = 50;
    final (rx, ry) = size2DToCircleRadius(
      circumferenceX,
      circumferenceY,
      scale: scale,
    );
    // with this image size and world scale we have:
    //  rx = 6923 km
    //  ry = 5411 km
    var plan = Plan2D<int>.planet(
      realRadiusX: Unit.kilometre(rx),
      realRadiusY: Unit.kilometre(ry),
      scale: scale,
      innerDataDefaultValue: 12,
      outerDataDefaultValue: 0,
    );

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
      realWidth: width,
    );

    test('Check', () {
      // should be `circumference * scale` but we can have uncertainties...
      expect(plan.realWidth.value.round(), circumferenceX * scale);
      expect(plan.realHeight.value.round(), circumferenceY * scale);

      expect(plan.axisWidth, circumferenceX);
      expect(plan.axisHeight, circumferenceY);

      expect(plan.square, circumferenceX * circumferenceY);

      expect(plan.background!.npath, 'test/data/planet_a_raw/bg.png');
      expect(plan.background!.image, isNotNull);

      final imagery = plan.imageries.single as PictureImagery;
      expect(imagery.npath, 'test/data/planet_a_raw/ri/bg.png');
      expect(imagery.image, isNotNull);
      expect(imagery.image.width, 3520);
      expect(imagery.image.height, 2496);
      expect(imagery.position, position);
      expect(imagery.realWidth, width);
      // calculated by [width] and image size
      expect(imagery.realHeight.floor(), Unit.kilometre(780));

      // check imagery size into plan
      final (isx, isy) = plan.axisSizeImagery(imagery);
      expect((isx, isy), (90, 64));
    });

    test('Export and check', () {
      // TODO
    });
  });
}
