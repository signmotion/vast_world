part of '../../../vast_world.dart';

class PictureComponent extends VComponent<Image> {
  @override
  Image get empty => Image.empty();

  Image get image => value;

  int get width => image.width;

  int get height => image.height;
}
