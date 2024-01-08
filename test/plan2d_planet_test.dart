import 'package:astronomical_measurements/astronomical_measurements.dart';
import 'package:dart_helpers/dart_helpers.dart';
import 'package:id_gen/id_gen.dart';
import 'package:vast_world/vast_world.dart';
import 'package:test/test.dart';

import 'prepare_test_env.dart';

void main() {
  prepareTestEnv();

  group('Construct Plan2D.planet', () {
    final plan = Plan2D<int>.planet(
      'm12/bg.png',
      realRadius: Unit.kilometre(6000),
      // 1 cell ~= 10 km
      scale: 10,
      innerDataDefaultValue: 12,
      outerDataDefaultValue: 0,
    );

    const circumference = 3770;

    test('Check IDs', () {
      expect(plan.hid, 'm12');
      expect(plan.uid.isUuid, isTrue);
      expect(plan.id, plan.hid);
    });

    test('Check axises', () {
      expect(plan.axisWidth, circumference);
      expect(plan.axisHeight, circumference);
      expect(plan.anchors, [Anchor1D.left, Anchor1D.top]);
      expect(plan.axisAbsSizes, [circumference, circumference]);
      expect(plan.axisUppers, [circumference - 1, circumference - 1]);
      expect(plan.axisLowers, [0, 0]);
      expect(plan.axisTypes, [AxisType.loop, AxisType.loop]);
    });

    test('Check square', () {
      expect(plan.square, plan.axisWidth * plan.axisHeight);
      expect(plan.square, plan.axisVolume);
    });
  });
}
