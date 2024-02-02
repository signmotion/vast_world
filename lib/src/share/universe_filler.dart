part of '../../../vast_world_share.dart';

/// Fill [u] from source.
class UniverseFiller {
  const UniverseFiller(this.u);

  final Universe u;

  Universe fromLore(Lore lore) => fromLoreBase(lore.base);

  Universe fromLoreBase(LoreBase base) {
    logi('🧙‍♂️🟨 Filling universe from lore'
            ' `${base.shortMapWithSignificantFieldsMessage}...'
        .bittenOfAllUuids32);

    // plans
    for (final p in base.plans.values) {
      PlanBuilder(u).fromBase(p);
    }

    logi('🧙‍♂️💚 Universe filled with'
        ' ${base.plans.length} plans from lore.');

    return u;
  }
}
