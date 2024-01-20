import 'dart:io';

import 'package:path/path.dart' as pf;
import 'package:vast_world/vast_world.dart';
import 'package:test/test.dart';

import 'prepare_test_env.dart';

void main() {
  prepareTestEnv();

  group('FilesystemBroker Text', () {
    final outputPath =
        pf.join('test', 'output', 'filesystem_broker_test', 'text');
    final broker = TextFilesystemBroker(outputPath);

    const key = '1.txt';
    const value = 'Some\nmultiline text\n\t1234567890  ';

    setUp(() {
      broker.clear();
      expect(broker.exists(key), isFalse);
    });

    broker.clear();

    test('Write and read', () {
      // write
      broker.write(key, value);
      expect(File(pf.join(outputPath, key)).existsSync(), isTrue);

      // read
      final r = broker.read(key);
      expect(r, value);
    });

    test('Reading a not exists key', () {
      final r = broker.read('some_not_exists_key');
      expect(r, isNull);
    });
  });
}
