import 'package:vast_world/vast_world.dart';

typedef Keeper = PlanTiledmapKeeper<Plan<dynamic>, ImageFilesystemBroker,
    TextFilesystemBroker, XmlFilesystemBroker>;

Keeper constructKeeper(String outputPath) => Keeper(
      textBroker: TextFilesystemBroker(outputPath),
      imageBroker: ImageFilesystemBroker(outputPath),
      xmlBroker: XmlFilesystemBroker(outputPath),
      readOnly: false,
    );
