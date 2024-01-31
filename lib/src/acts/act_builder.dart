part of '../../vast_world.dart';

class ActBuilder {
  const ActBuilder();

  T fromJson<T extends Act>(JsonMap json) => fromBase(jsonAsActBase(json));

  T fromBase<T extends Act>(ActBase base) {
    logi('🧙‍♂️🟨 Constructing act based on '
        '`${base.shortMapWithSignificantFieldsMessage}...');

    final act = switch (base.type) {
      ActTypeEnum.CHANGE_VALUE_ACT_TYPE => ChangeValueAct(
          debugName: base.debugName,
          uid: base.uid,
          planId: base.planId,
          components: {
            for (final e in base.components.entries)
              e.key: const ComponentBuilder().fromBase(e.value)
          },
        ),
      // unsupported
      _ => throw UnimplementedError(base.sjson),
    };

    logi('🧙‍♂️💚 Act `$act` constructed.');

    return act as T;
  }
}
