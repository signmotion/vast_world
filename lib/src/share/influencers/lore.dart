part of '../../../vast_world_share.dart';

/// Impact [Act] to [Lore].
class LoreInfluencer extends Influencer<Lore> {
  const LoreInfluencer();

  @override
  Lore processing(Universe u, Lore o, Act act) => act.run(u, o);
}
