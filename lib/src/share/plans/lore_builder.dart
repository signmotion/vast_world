part of '../../../vast_world_share.dart';

class LoreBuilder {
  const LoreBuilder(
    this.u, {
    required this.planBuilder,
    required this.componentBuilder,
  });

  final Universe u;

  final TPlanBuilder planBuilder;
  final TComponentBuilder componentBuilder;

  Lore get emptyLore => Lore(u, componentBuilder: componentBuilder);

  T fromJson<T extends Lore>(JsonMap json) => fromBase(jsonAsLoreBase(json));

  T fromBase<T extends Lore>(LoreBase base) {
    logger.i('🧙‍♂️🟨 Constructing lore based on'
            ' `${base.shortMapWithSignificantFieldsMessage.sjsonInLine}...'
        .bittenOfAllUuids32);

    final b = planBuilder(emptyLore);
    final plans = {
      for (final p in base.plans.entries) p.key: b.fromBase(p.value)
    };
    final lore = Lore(u, plans: plans, componentBuilder: componentBuilder);

    logger.i('🧙‍♂️💚 Lore `${lore.sjsonInLine}` constructed.');

    return lore as T;
  }
}
