part of '../../vast_world.dart';

/// Impact [Act] to [Lore].
class LoreInfluencer extends Influencer<Lore> {
  const LoreInfluencer();

  @override
  Lore processing(Lore o, Act act) => act.run(o);
}
