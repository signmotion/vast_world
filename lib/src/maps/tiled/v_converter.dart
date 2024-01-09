import 'package:dart_tiledmap/dart_tiledmap.dart';

import 'v_map.dart';

class VConverter {
  const VConverter({this.pretty = true});

  /// Pretty formatted result.
  final bool pretty;

  String convert(VMap map) =>
      TileMapConverter.convertToTmx(map).toXmlString(pretty: pretty);
}
