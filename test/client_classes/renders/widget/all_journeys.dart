import 'package:vast_world/vast_world_share.dart';

import 'widget.dart';

ClientWidgetT clientAllJourneysWidgetRender(
  Plan spectator,
  Plan watched,
  Lore lore,
) {
  //const configure = WidgetRenderConfigure();

  String contentRender(
    Plan spectator,
    Plan watched,
  ) {
    return 'contentRender() $watched';
  }

  final content = contentRender(spectator, watched);

  return (content: content);
}
