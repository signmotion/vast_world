part of '../../../vast_world.dart';

class VObjectsLayer extends ObjectGroup {
  VObjectsLayer({
    required super.id,
    required super.name,
    List<VObject> objects = const [],
  }) : super(objects: objects);
}

class VImageries extends VObjectsLayer {
  VImageries({
    required super.id,
    super.objects,
  }) : super(name: defaultImageriesLayerName);

  static const defaultImageriesLayerName = 'imageries';
}

/// Any components keeps into [ObjectGroup].
class VConcreteComponent extends VObjectsLayer {
  VConcreteComponent({
    required super.id,
    required super.name,
    super.objects,
  });
}
