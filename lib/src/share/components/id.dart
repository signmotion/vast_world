part of '../../../vast_world_share.dart';

typedef IdT = ({
  String hid,
  String uid,
});

class IdComponent extends Component<IdT> {
  /// ! There is UID for this component, not his [value].
  @override
  String get uid => '$componentUidPrefix-$suid';

  static const suid = 'd009a66a-1a05-4ea1-9658-10900ce5b8a7';

  @override
  void initv(IdT v) => value = (
        hid: v.hid,
        uid: v.uid,
      );

  @override
  void check() {
    argerr(hid.isEmpty || isCorrectHid, hid, 'hid');
    argerr(isCorrectUid, uid, 'uid');
    ae(hid.isNotEmpty || uid.isNotEmpty, 'Hid or UID should be defined.');
  }

  @override
  IdT get empty => (hid: '', uid: '');

  @override
  JsonMap get valueAsJson => {'hid': hid, 'uid': uid};

  @override
  IdT jsonAsValue(JsonMap json) => switch (json) {
        {'hid': String? hid, 'uid': String? uid} => (
            hid: hid ?? '',
            uid: uid ?? '',
          ),
        _ => throw IllegalArgumentError('json', json.sjson, StackTrace.current),
      };
}
