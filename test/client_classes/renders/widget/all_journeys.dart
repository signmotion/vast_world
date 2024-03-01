import 'package:vast_world/vast_world_share.dart';

import 'widget.dart';

ClientWidgetT clientAllJourneysWidgetRender(
  Plan<Plan<dynamic>> spectator,
  Plan<Plan<dynamic>> watched,
  Lore lore,
) {
  //const configure = WidgetRenderConfigure();

  String contentRender(
    Plan<Plan<dynamic>> spectator,
    Plan<Plan<dynamic>> watched,
  ) {
    return 'contentRender() $watched';
  }

  final content = contentRender(spectator, watched);

  return (content: content);
}
