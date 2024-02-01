part of '../../../../vast_world_share.dart';

/// ! Setting [pretty] to `true` can get a lost of newlines for inner texts.
class VConverter {
  const VConverter({this.pretty = false, this.newLine = '\r\n'});

  /// Pretty formatted result.
  final bool pretty;

  /// New line.
  final String newLine;

  String convert(VMap map) => TileMapConverter.convertToTmx(map)
      .toXmlString(pretty: pretty, newLine: newLine);
}
