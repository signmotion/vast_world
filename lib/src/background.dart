import 'package:image/image.dart';

import 'can_load_file.dart';

class Background extends CanLoadFile {
  const Background([super.path = defaultFilename, this.image]);

  static const defaultFilename = 'bg.png';

  final Image? image;
}
