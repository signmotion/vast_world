part of '../../../vast_world_share.dart';

typedef TActBuilder = TBuilder<NativeActBuilder>;

class NativeActBuilder {
  const NativeActBuilder(this.componentBuilder);

  /// We can use inheritanced builder.
  final TComponentBuilder componentBuilder;

  T fromJson<T extends Act>(JsonMap json) => fromBase(jsonAsActBase(json));

  T fromBase<T extends Act>(ActBase base) {
    logger.i('🧙‍♂️🟨 Constructing act based on'
            ' `${base.shortMapWithSignificantFieldsMessage.sjsonInLine}'
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
          spectatorId: base.spectatorId,
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

    logger.i('🧙‍♂️💚 Act `${act.sjsonInLine}` constructed.');

    return act as T;
  }
}
