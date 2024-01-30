part of '../../vast_world.dart';

/// By analogy with [Component] and [Plan].
/// See [ActBuilder].
abstract class Act with HasStringIdMix {
  Act({
    this.type = ActTypeEnum.UNSPECIFIED_ACT_TYPE,
    this.debugName,
    String? uid,
    this.planId,
    this.values = const {},
  }) {
    this.uid = uid ?? genUuid;
  }

  final String? debugName;
  final ActTypeEnum type;
  final String? planId;

  /// <component_id, sjson_value>
  final Map<String, String> values;

  /// This act converted to [ActBase].
  /// See [jsonAsBase].
  ActBase get base => ActBase(
        debugName: debugName,
        uid: uid,
        type: type,
        planId: planId,
        values: values,
      );

  T run<T>(T o) {
    logi('Runnint the act `$this` on the `$o`...');

    return innerRun<T>(o);
  }

  T innerRun<T>(T o);

  JsonMap get baseAsJson => base.toProto3Json() as JsonMap;

  /// See [base].
  /// See [jsonAsActBase].
  ActBase jsonAsBase(JsonMap json) => jsonAsActBase(json);

  @override
  String toString() => '${base.shortMapWithSignificantFieldsMessage.blured()}';
}

ActBase jsonAsActBase(JsonMap json) => switch (json) {
      {
        'debugName': String? debugName,
        'uid': String? uid,
        'type': ActTypeEnumBase type,
        'planId': String? planId,
        'values': Map<String, String> values,
      } =>
        ActBase(
          debugName: debugName,
          uid: uid,
          type: type,
          planId: planId,
          values: values,
        ),
      _ => throw ArgumentError(json.sjson),
    };

typedef ActTypeEnum = ActTypeEnumBase;
