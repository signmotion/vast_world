part of '../../../vast_world.dart';

typedef BackgroundT = DEPRECATED_Background;

class DEPRECATED_BackgroundComponent extends VComponent<BackgroundT> {
  @override
  BackgroundT get empty => DEPRECATED_Background('', image: Image.empty());

  @override
  void check() {
    ae(value.image != null, '`background` not found.');
  }
}
