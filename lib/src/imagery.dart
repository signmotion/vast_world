import 'package:astronomical_measurements/astronomical_measurements.dart';

import 'background.dart';
import 'can_load_file.dart';

class Imagery extends CanLoadFile {
  const Imagery(
    super.path, {
    required this.position,
    required this.width,
    this.height,
    this.background,
  });

  final (int, int) position;
  final Unit width;

  final Unit? height;
  final Background? background;
}
