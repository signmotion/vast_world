import 'background.dart';
import 'can_work_with_file.dart';
import 'has_id.dart';

class Quant extends FileWorker with HasId, ReadFileAsImage {
  Quant(
    super.pathToBackground, {
    String? hid,
    String? uid,
  }) {
    this.hid = hid ?? extractHid();
    this.uid = uid ?? generateUid();
  }

  // test/data/planet_raw/raeria/bg.jpg
  // test/data/planet_raw/raeria/ri/bg.png
  String extractHid() => npath.split('/').reversed.elementAt(1);

  Background get background => Background(path);
}
