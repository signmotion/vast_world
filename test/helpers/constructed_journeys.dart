import 'package:vast_world/vast_world.dart';

AllJourneysPlan get constructedAerwynaJourneyFromRaw {
  final u = Universe();

  const sourcePath =
      'test/data/journeys/aerwyna_journey_raw/journey_list/0.aerwyna';

  // root plan: without parent ID
  final allJourneys = AllJourneysPlan(u, '', hid: 'all');

  // journey by Aerwyna
  final about =
      FileWorker(sourcePath).readAsJsonMapString(pathToFile: '_.json')!;
  final aerwynaJourney = JourneyPlan(
    u,
    allJourneys.id,
    hid: 'aerwyna',
    name: 'Aerwyna',
    greeting: about['greeting']!,
    description: about['description']!,
  );
  final placeCount = int.parse(about['place_count']!);
  for (var i = 0; i < placeCount; ++i) {
    final picture =
        FileWorker(sourcePath).readAsImage(pathToFile: 'place_list/$i.png');
    final story = 'Some story into the place $i...';
    final place = PlacePlan(
      u,
      aerwynaJourney.id,
      hid: 'place_$i',
      picture: picture,
      story: story,
    );
    aerwynaJourney.addImagery(place);
  }

  allJourneys.addImagery(aerwynaJourney);

  return allJourneys;
}
