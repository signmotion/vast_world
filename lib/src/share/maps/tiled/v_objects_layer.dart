part of '../../../../vast_world_share.dart';

class VObjectsLayer extends ObjectGroup {
  VObjectsLayer({
    required super.id,
    required super.name,
    List<VObject> objects = const [],
  }) : super(objects: objects);
}

class VExposedList extends VObjectsLayer {
  VExposedList({
    required super.id,
    super.objects,
  }) : super(name: defaultExposedLayerName);

  static const defaultExposedLayerName = 'exposed';
}

/// Any components keeps into [ObjectGroup].
class VConcreteComponent extends VObjectsLayer {
  VConcreteComponent({
    required super.id,
    required super.name,
    super.objects,
  });
}
