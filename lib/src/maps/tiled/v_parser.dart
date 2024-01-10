part of '../../../vast_world.dart';

class VParser {
  const VParser();

  VMap parse(String body) => VMap.fromTiledMap(TileMapParser.parseTmx(body));
}
