part of '../../../vast_world.dart';

typedef BackgroundT = Background;

class BackgroundComponent extends VComponent<BackgroundT> {
  @override
  BackgroundT get empty => Background('', image: Image.empty());

  @override
  void check() {
    ae(value.image != null, '`background` not found.');
  }
}
