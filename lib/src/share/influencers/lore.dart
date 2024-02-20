part of '../../../vast_world_share.dart';

/// Impact [Act] to [Lore].
class LoreInfluencer extends Influencer<Lore> {
  const LoreInfluencer({
    required super.u,
    required super.planBuilder,
    required super.componentBuilder,
  });

  @override
  Lore processingOnClient(Lore o, Act act) => processingOnServer(o, act);

  @override
  Lore processingOnServer(Lore o, Act act) => act.runOnServer(
        u,
        o,
        planBuilder: planBuilder,
        componentBuilder: componentBuilder,
      );
}
