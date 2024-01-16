part of '../../../vast_world.dart';

typedef ParentT = ({
  /// HID or UID
  String id,
});

class ParentComponent extends VComponent<ParentT> {
  @override
  void initv(ParentT v) => value = (id: v.id);

  @override
  void check() {
    // a root plan can be without parent ID
    argerr(id.isEmpty || id.isCorrectId, value.id, 'id');
  }

  @override
  ParentT get empty => (id: '');

  /// Human ID or UID.
  String get id => value.id;
}
