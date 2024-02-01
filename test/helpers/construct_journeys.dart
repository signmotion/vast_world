import 'package:vast_world/vast_world_share.dart';
import 'package:wfile/wfile.dart';

Plan<dynamic> get constructedAerwynaJourneyFromRaw {
  final u = Universe();

  const sourcePath =
      'test/data/journeys/aerwyna_journey_raw/journey_list/0.aerwyna';
  final f = WFile(sourcePath);

  // root plan: without parent ID
  final allJourneys = constructAllJourneysPlan(u, hid: 'all_journeys');

  // journey by Aerwyna
  final about = f.readAsJsonMapString('_.json')!;
  final aerwynaJourney = constructJourneyPlan(
    u,
    hid: 'aerwyna',
    name: 'Aerwyna',
    greeting: about['greeting']!,
    description: about['description']!,
  );
  final placeCount = int.parse(about['place_count']!);
  for (var i = 0; i < placeCount; ++i) {
    final picture = f.readAsImage('place_list/$i.png')!;
    final textStory = i == 4
        ? f.readAsText('place_list/$i/story/story.md')!
        : 'Some story into the place $i...';
    final place = constructPlacePlan(
      u,
      hid: 'place_$i',
      picture: picture,
      story: (text: textStory),
    );
    aerwynaJourney.addToImpacts(place);
  }

  allJourneys.addToImpacts(aerwynaJourney);

  return allJourneys;
}
