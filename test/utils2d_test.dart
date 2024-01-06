import 'package:test/test.dart';
import 'package:vast_world/vast_world.dart';

import 'prepare_test_env.dart';

void main() {
  prepareTestEnv();

  group('size1DToCircleRadius', () {
    test('Correct sizes', () {
      expect(size1DToCircleRadius(377000, scale: 0.1), 6000);
      expect(size1DToCircleRadius(37700, scale: 1), 6000);
      expect(size1DToCircleRadius(3770, scale: 10), 6000);
      expect(size1DToCircleRadius(377, scale: 100), 6000);
      expect(size1DToCircleRadius(37, scale: 1000), 5888);
      expect(size1DToCircleRadius(38, scale: 1000), 6047);

      // radiuses for frequency image sizes and scale 1 cell == 50 km
      expect(size1DToCircleRadius(128, scale: 50), 1018);
      expect(size1DToCircleRadius(256, scale: 50), 2037);
      expect(size1DToCircleRadius(512, scale: 50), 4074);
      expect(size1DToCircleRadius(1024, scale: 50), 8148);
      expect(size1DToCircleRadius(2048, scale: 50), 16297);
      expect(size1DToCircleRadius(4096, scale: 50), 32594);
    });
  });
}
