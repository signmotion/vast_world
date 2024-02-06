part of '../../../vast_world_share.dart';

typedef UnimplementedT = ({
  String idUnimplemented,
});

/// Contains an unimplemented component.
/// For example, render widget into the Server side.
class UnimplementedComponent extends Component<UnimplementedT> {
  @override
  String get uid => '$componentUidPrefix-$suid';

  static const suid = '00000000-0000-0000-0000-000000000000';

  @override
  void initv(UnimplementedT v) => value = (idUnimplemented: v.idUnimplemented);

  @override
  void check() {
    argerr(
      value.idUnimplemented.isNotEmpty,
      value.idUnimplemented,
      'idUnimplemented',
    );
  }

  @override
  UnimplementedT get empty => (idUnimplemented: '');

  @override
  JsonMap get valueAsJson => {'id_unimplemented': value.idUnimplemented};

  @override
  UnimplementedT jsonAsValue(JsonMap json) => switch (json) {
        {'id_unimplemented': String? idUnimplemented} => (
            idUnimplemented: idUnimplemented ?? '',
          ),
        _ => throw ArgumentError(json.sjson),
      };
}
