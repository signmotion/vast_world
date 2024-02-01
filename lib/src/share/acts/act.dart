part of '../../../vast_world_share.dart';

/// By analogy with [Component] and [Plan].
/// See [ActBuilder].
abstract class Act with HasProtoBaseMix, HasStringIdMix {
  Act({
    this.debugName,
    String? uid,
    required this.type,
    this.planId,
    this.components = const {},
  }) {
    this.uid = uid ?? genActUid;
  }

  final String? debugName;
  final ActTypeEnum type;

  final String? planId;
  String? get planHid => planId?.isPlanHid ?? false ? planId : null;
  String? get planUid => planId?.isPlanUid ?? false ? planId : null;

  /// Initialized components.
  /// By analogy with [Plan].
  /// <component_id, ComponentBase>
  final Map<String, Component<dynamic>> components;

  /// This act converted to [ActBase].
  /// See [jsonAsBase].
  @override
  ActBase get base => ActBase(
        debugName: debugName,
        uid: uid,
        type: type,
        planId: planId,
        components: {for (final e in components.entries) e.key: e.value.base},
      );

  @override
  bool get isCorrectUid => uid.isActUid;

  T run<T>(Universe u, T o) {
    logi('Running the act `$this` on the `$o`...'.bittenOfAllUuids32);

    return innerRun<T>(u, o);
  }

  T innerRun<T>(Universe u, T o);

  /// See [base].
  /// See [jsonAsActBase].
  @override
  ActBase jsonAsBase(JsonMap json) => jsonAsActBase(json);
}

ActBase jsonAsActBase(JsonMap json) => switch (json) {
      {
        'debugName': String? debugName,
        'uid': String? uid,
        'type': ActTypeEnumBase type,
        'planId': String? planId,
        'components': Map<String?, Object?> components,
      } =>
        ActBase(
          debugName: debugName,
          uid: uid,
          type: type,
          planId: planId,
          components: {
            for (final c in components.entries)
              c.key!: ComponentBase.create()
                ..mergeFromProto3Json(c.value as JsonMap)
          },
        ),
      _ => throw ArgumentError(json.sjson),
    };

typedef ActTypeEnum = ActTypeEnumBase;
