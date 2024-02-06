import 'package:vast_world/vast_world_share.dart';

import 'widget.dart';

ClientWidgetT clientAllJourneysWidgetRender(
  Plan<dynamic> spectator,
  Plan<dynamic> watched,
) {
  //const configure = WidgetRenderConfigure();

  String contentRender(
    Plan<dynamic> spectator,
    Plan<dynamic> watched,
  ) {
    return 'contentRender() $watched';
  }

  final content = contentRender(spectator, watched);

  return (content: content);
}
