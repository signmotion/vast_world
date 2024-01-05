import 'package:astronomical_measurements/astronomical_measurements.dart';
import 'package:dart_helpers/dart_helpers.dart';
import 'package:vast_world/vast_world.dart';
import 'package:test/test.dart';

import 'prepare_test_env.dart';

void main() {
  prepareTestEnv();

  group('Construct Plan2D.surface borderless', () {
    final plan = Plan2D<int>.surface(
      width: 600,
      height: 200,
      axisType: AxisType.borderless,
      unitType: UnitType.kilometre,
      innerDataDefaultValue: 12,
      outerDataDefaultValue: 0,
    );

    test('Check axises', () {
      expect(plan.width, 600);
      expect(plan.height, 200);
      expect(plan.anchors, [Anchor1D.left, Anchor1D.top]);
      expect(plan.axisAbsSizes, [600, 200]);
      expect(plan.axisUppers, [600 - 1, 200 - 1]);
      expect(plan.axisLowers, [0, 0]);
      expect(plan.axisTypes, [AxisType.borderless, AxisType.borderless]);
      expect(plan.unitType, UnitType.kilometre);
    });

    test('Check square', () {
      expect(plan.square, plan.width * plan.height);
      expect(plan.square, plan.axisVolume);
    });

    test('Get data in surface', () {
      expect(plan[(0, 0)], 12);
      expect(plan[(600 - 1, 200 - 1)], 12);
      expect(plan[(0, 0)], 12);
    });

    test('Get data out of surface', () {
      expect(plan[(600, 200)], 0);
      expect(plan[(-1, 0)], 0);
      expect(plan[(0, -1)], 0);
      expect(plan[(-1, -1)], 0);
      expect(plan[(-600, -200)], 0);
    });

    test('Set and Get data in surface', () {
      plan[(0, 0)] = 456;
      expect(plan[(0, 0)], 456);

      plan[(600 - 1, 200 - 1)] = 78;
      expect(plan[(600 - 1, 200 - 1)], 78);
    });

    test('Set and Get data out of surface', () {
      plan[(-1, 0)] = 456;
      expect(plan[(-1, 0)], 0);
      plan[(0, -1)] = 457;
      expect(plan[(0, -1)], 0);
      plan[(-1, -1)] = 458;
      expect(plan[(-1, -1)], 0);

      plan[(600, 200)] = 78;
      expect(plan[(600, 200)], 0);
    });
  });

  group('Construct Plan2D.surface borderstrict', () {
    final plan = Plan2D<int>.surface(
      width: 600,
      height: 200,
      axisType: AxisType.borderstrict,
      unitType: UnitType.kilometre,
      innerDataDefaultValue: 12,
      outerDataDefaultValue: 0,
    );

    test('Get data out of surface', () {
      expect(plan[(600, 200)], 12);
      expect(plan[(-1, 0)], 12);
      expect(plan[(0, -1)], 12);
      expect(plan[(-1, -1)], 12);
      expect(plan[(-600, -200)], 12);
    });

    test('Set and Get data out of surface', () {
      plan[(-1, 0)] = 456;
      expect(plan[(-1, 0)], 456);
      expect(plan[(0, 0)], 456);

      plan[(0, -1)] = 457;
      expect(plan[(0, -1)], 457);
      expect(plan[(0, 0)], 457);

      plan[(-1, -1)] = 458;
      expect(plan[(-1, -1)], 458);
      expect(plan[(0, 0)], 458);

      plan[(600, 200)] = 78;
      expect(plan[(600, 200)], 78);
      expect(plan[(600 - 1, 200 - 1)], 78);
    });
  });
}
