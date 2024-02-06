part of '../../../vast_world_share.dart';

/// Impact [Act] to [Lore].
class LoreInfluencer extends Influencer<Lore> {
  const LoreInfluencer({
    required super.u,
    required super.planBuilder,
    required super.componentBuilder,
  });

  @override
  Lore processing(Lore o, Act act) => act.run(
        u,
        o,
        planBuilder: planBuilder,
        componentBuilder: componentBuilder,
      );
}
