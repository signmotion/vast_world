part of '../../../vast_world_share.dart';

class LoreBuilder {
  const LoreBuilder(this.u);

  final Universe u;

  T fromJson<T extends Lore>(JsonMap json) => fromBase(jsonAsLoreBase(json));

  T fromBase<T extends Lore>(LoreBase base) {
    logi('🧙‍♂️🟨 Constructing lore based on'
            ' `${base.shortMapWithSignificantFieldsMessage}...'
        .bittenOfAllUuids32);

    final lore = Lore(
      plans: {
        for (final p in base.plans.entries)
          p.key: NativePlanBuilder(u).fromBase(p.value)
      },
    );

    logi('🧙‍♂️💚 Lore `$lore` constructed.');

    return lore as T;
  }
}
