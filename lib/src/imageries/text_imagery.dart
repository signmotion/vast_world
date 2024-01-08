import '../can_work_with_file.dart';
import 'imagery.dart';

/// Build imagery by text description.
class TextImagery extends Imagery with ReadFileAsText {
  TextImagery(
    super.pathToTextFile, {
    required super.position,
    required super.realWidth,
  }) {
    // TODO realHeight = ...
  }
}
