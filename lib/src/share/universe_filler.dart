part of '../../../vast_world_share.dart';

/// Fill [u] from source.
class UniverseFiller {
  const UniverseFiller(
    this.u, {
    required this.planBuilder,
    required this.componentBuilder,
  });

  final Universe u;

  final T2Builder<NativePlanBuilder, Universe, TBuilder<NativeComponentBuilder>>
      planBuilder;
  final TBuilder<NativeComponentBuilder> componentBuilder;

  Universe fromLore(Lore lore) => fromLoreBase(lore.base);

  Universe fromLoreBase(LoreBase base) {
    logi('🧙‍♂️🟨 Filling universe from lore'
            ' `${base.shortMapWithSignificantFieldsMessage}...'
        .bittenOfAllUuids32);

    // plans
    for (final p in base.plans.values) {
      final b = NativePlanBuilder(u, componentBuilder);
      b.fromBase(p);
    }

    logi('🧙‍♂️💚 Universe filled with'
        ' ${base.plans.length} plans from lore.');

    return u;
  }
}
