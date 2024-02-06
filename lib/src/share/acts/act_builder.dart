part of '../../../vast_world_share.dart';

class NativeActBuilder {
  const NativeActBuilder(this.componentBuilder);

  /// We can use inheritanced builder.
  final TBuilder<NativeComponentBuilder> componentBuilder;

  T fromJson<T extends Act>(JsonMap json) => fromBase(jsonAsActBase(json));

  T fromBase<T extends Act>(ActBase base) {
    logi('🧙‍♂️🟨 Constructing act based on'
            ' `${base.shortMapWithSignificantFieldsMessage}'
            ' with `${componentBuilder().runtimeType}`...'
        .bittenOfAllUuids32);

    final initializedComponents = [
      for (final e in base.components.entries)
        componentBuilder().fromBase(e.value)
    ];
    final act = switch (base.type) {
      ActTypeEnum.ADD_PLAN_ACT_TYPE => AddPlanAct(
          debugName: base.debugName,
          uid: base.uid,
          planId: base.planId,
          initializedComponents: initializedComponents,
        ),
      ActTypeEnum.CHANGE_VALUE_ACT_TYPE => ChangeValueAct(
          debugName: base.debugName,
          uid: base.uid,
          planId: base.planId,
          initializedComponents: initializedComponents,
        ),
      // unsupported
      _ => throw UnimplementedError(base.sjson),
    };

    logi('🧙‍♂️💚 Act `$act` constructed.');

    return act as T;
  }
}
