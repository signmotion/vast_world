import 'package:dart_helpers/dart_helpers.dart';
import 'package:vast_world/vast_world.dart' hide Keeper;
import 'package:test/test.dart';

import 'helpers_2d.dart';
import 'prepare_test_env.dart';

void main() {
  prepareTestEnv();

  group('Work with the west sea and askatria Plan2D, tmx format', () {
    test('Read from TiledMap format, save and check it', () {
      const sourcePath = 'test/data/worlds/west_seas_and_askatria_tmx';
      const hid = 'ri';
      const scale = 0.3125;
      const axisSize = (3520, 2496);

      final keeper = Keeper(
        textBroker: TextFilesystemBroker(sourcePath),
        imageBroker: ImageFilesystemBroker(sourcePath),
      );
      final loaded = keeper.read(hid);
      expect(loaded, isNotNull);

      final imageries = <String, JsonMap>{
        // !) this is a HID for imagery, not for a plan
        // for construct a plan we are using [imagery.hidForPlan]
        'ri.askatria_land': {
          'axisPosition': (608, 2335),
          'axisSize': (1280, 936),
          'axisSizeInPlan': (1280, 936),
        },
        'ri.askatria_sea': {
          'axisPosition': (0, 2496),
          'axisSize': (1008, 632),
          'axisSizeInPlan': (1008, 632),
        },
        'ri.elf_sea': {
          'axisPosition': (384, 2496),
          'axisSize': (712, 320),
          'axisSizeInPlan': (712, 320),
        },
      };

      checkPlan(
        loaded!,
        planHid: hid,
        npath: '$sourcePath/$hid',
        scale: scale,
        axisSize: axisSize,
        imageries: imageries,
      );
    });
  });
}
