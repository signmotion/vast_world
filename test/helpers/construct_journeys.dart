import 'package:vast_world/vast_world_share.dart';
import 'package:wfile/wfile.dart';

import '../plans/all_journeys.dart';
import '../plans/journey.dart';
import '../plans/place.dart';

/// Returns ID of constructed plan into the [lore].
Plan<Plan<dynamic>> constructedAerwynaJourneyFromRaw(Lore lore) {
  const sourcePath =
      'test/data/journeys/aerwyna_journey_raw/journey_list/0.aerwyna';
  final f = WFile(sourcePath);

  // root plan: without parent ID
  final allJourneys = constructAllJourneysPlan(
    lore,
    hid: 'all_journeys',
  );

  // journey by Aerwyna
  final about = f.readAsJsonMapString('_.json')!;
  final aerwynaJourney = constructJourneyPlan(
    lore,
    hid: 'aerwyna',
    name: 'Aerwyna',
    greeting: about['greeting']!,
    description: about['description']!,
  );
  final placeCount = int.parse(about['place_count']!);
  for (var i = 0; i < placeCount; ++i) {
    final picture = f.readAsImage('place_list/$i.png')!;
    final titleStory = 'Title $i';
    final textStory = i == 4
        ? f.readAsText('place_list/$i/story/story.md')!
        : 'Some story into the place $i...';
    final place = constructPlacePlan(
      lore,
      hid: 'place_$i',
      picture: picture,
      story: (title: titleStory, text: textStory),
    );
    aerwynaJourney.addToExposed(place.id);
  }

  allJourneys.addToExposed(aerwynaJourney.id);

  return allJourneys;
}
