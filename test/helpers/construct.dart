import 'package:vast_world/vast_world_share.dart';
import 'package:wfile/wfile.dart';

typedef Keeper = PlanTiledmapKeeper<Plan, ImageFilesystemBroker,
    TextFilesystemBroker, XmlFilesystemBroker>;

Keeper constructKeeper(String outputPath) => Keeper(
      textBroker: TextFilesystemBroker(outputPath),
      imageBroker: ImageFilesystemBroker(outputPath),
      xmlBroker: XmlFilesystemBroker(outputPath),
      readOnly: false,
    );
