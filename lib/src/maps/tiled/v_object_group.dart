part of '../../../vast_world.dart';

class VObjectGroup extends ObjectGroup {
  VObjectGroup({
    required super.id,
    required super.name,
    List<VObject> objects = const [],
  }) : super(objects: objects);
}

class VImageryObjectGroup extends VObjectGroup {
  VImageryObjectGroup({
    required super.id,
    super.objects,
  }) : super(name: 'imageries');
}
