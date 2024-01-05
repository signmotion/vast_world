import 'package:astronomical_measurements/astronomical_measurements.dart';
import 'package:dart_helpers/dart_helpers.dart';
import 'package:vast_world/vast_world.dart';
import 'package:test/test.dart';

import 'prepare_test_env.dart';

void main() {
  prepareTestEnv();

  group('Construct Plan2D.planet', () {
    final plan = Plan2D<int>.planet(
      radius: 500,
      unitType: UnitType.kilometre,
      innerDataDefaultValue: 12,
      outerDataDefaultValue: 0,
    );

    test('Check axises', () {
      expect(plan.width, 3142);
      expect(plan.height, 3142);
      expect(plan.anchors, [Anchor1D.left, Anchor1D.top]);
      expect(plan.axisAbsSizes, [3142, 3142]);
      expect(plan.axisUppers, [3142 - 1, 3142 - 1]);
      expect(plan.axisLowers, [0, 0]);
      expect(plan.axisTypes, [AxisType.loop, AxisType.loop]);
      expect(plan.unitType, UnitType.kilometre);
    });

    test('Check square', () {
      expect(plan.square, plan.width * plan.height);
      expect(plan.square, plan.axisVolume);
    });
  });
}
