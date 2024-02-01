part of '../../../vast_world_share.dart';

/// Impact [Act] to [Lore].
class LoreInfluencer extends Influencer<Lore> {
  const LoreInfluencer();

  @override
  void processing(Lore o, Act act) => act.run(o);
}
