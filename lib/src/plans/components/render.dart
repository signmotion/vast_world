part of '../../../vast_world.dart';

class RenderComponent extends VComponent<RenderBuilder?> {
  @override
  RenderBuilder? get empty => null;

  RenderBuilder? get render => value;
}
