import 'package:astronomical_measurements/astronomical_measurements.dart';
import 'package:dart_helpers/dart_helpers.dart';
import 'package:id_gen/id_gen.dart';
import 'package:vast_world/vast_world.dart';
import 'package:test/test.dart';

import 'prepare_test_env.dart';

void main() {
  prepareTestEnv();

  group('Construct Plan2D.surface borderless', () {
    final plan = Plan2D<int>.surface(
      'some_borderless_surface/${VMap.defaultBackgroundFilename}',
      realWidth: Unit.kilometre(600),
      realHeight: Unit.kilometre(200),
      axisType: AxisType.borderless,
      innerDataDefaultValue: 12,
      outerDataDefaultValue: 0,
    );

    test('Check IDs', () {
      expect(plan.hid, 'some_borderless_surface');
      expect(plan.uid.isUuid, isTrue);
      expect(plan.id, plan.hid);
    });

    test('Check axises', () {
      expect(plan.axisWidth, 600);
      expect(plan.axisHeight, 200);
      expect(plan.anchors, [Anchor1D.left, Anchor1D.top]);
      expect(plan.axisAbsSizes, [600, 200]);
      expect(plan.axisUppers, [600 - 1, 200 - 1]);
      expect(plan.axisLowers, [0, 0]);
      expect(plan.axisTypes, [AxisType.borderless, AxisType.borderless]);
    });

    test('Check square', () {
      expect(plan.square, plan.axisWidth * plan.axisHeight);
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
      'some_borderstrict_surface/${VMap.defaultBackgroundFilename}',
      realWidth: Unit.kilometre(600),
      realHeight: Unit.kilometre(200),
      axisType: AxisType.borderstrict,
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

  group('Construct Plan2D.surface loop', () {
    final plan = Plan2D<int>.surface(
      'some_loop_surface/${VMap.defaultBackgroundFilename}',
      realWidth: Unit.kilometre(600),
      realHeight: Unit.kilometre(200),
      axisType: AxisType.loop,
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
      expect(plan[(600 - 1, 0)], 456);

      plan[(0, -1)] = 457;
      expect(plan[(0, -1)], 457);
      expect(plan[(0, 200 - 1)], 457);

      plan[(-1, -1)] = 458;
      expect(plan[(-1, -1)], 458);
      expect(plan[(600 - 1, 200 - 1)], 458);

      plan[(600, 200)] = 78;
      expect(plan[(600, 200)], 78);
      expect(plan[(0, 0)], 78);
    });
  });
}
