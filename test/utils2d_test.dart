import 'package:test/test.dart';
import 'package:vast_world/vast_world_share.dart';

import 'prepare_test_env.dart';

void main() {
  prepareTestEnv();

  group('size1DToCircleRadius', () {
    test('Correct sizes', () {
      // should be 6000 but we have uncertainties...
      // the uncertainties are added after the value
      expect(size1DToCircleRadius(377000, scale: 0.1).round(), 6000);
      expect(size1DToCircleRadius(37700, scale: 1).round(), 6000);
      expect(size1DToCircleRadius(3770, scale: 10).round(), 6000);
      expect(size1DToCircleRadius(377, scale: 100).round(), 6000);
      expect(size1DToCircleRadius(37, scale: 1000).round(), 6000 - 111);
      expect(size1DToCircleRadius(38, scale: 1000).round(), 6000 + 48);

      // radiuses for frequency image sizes and scale 1 cell == 50 km
      expect(size1DToCircleRadius(128, scale: 50).round(), 1019);
      expect(size1DToCircleRadius(256, scale: 50).round(), 2037);
      expect(size1DToCircleRadius(512, scale: 50).round(), 4074);
      expect(size1DToCircleRadius(1024, scale: 50).round(), 8149);
      expect(size1DToCircleRadius(2048, scale: 50).round(), 16297);
      expect(size1DToCircleRadius(4096, scale: 50).round(), 32595);
    });
  });
}
