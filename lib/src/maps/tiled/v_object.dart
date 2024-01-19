part of '../../../vast_world.dart';

class VObject extends TiledObject {
  VObject({
    required super.id,
    super.gid,
    required super.name,
    required num x,
    required num y,
    required num width,
    required num height,
    String text = '',
    bool wrapText = true,
    super.tile = false,
  }) : super(
          x: x.toDouble(),
          y: y.toDouble(),
          width: width.toDouble(),
          height: height.toDouble(),
          text: text.isEmpty ? null : Text(text: text, wrap: wrapText),
        );
}

class VObjectText extends VObject {
  VObjectText({
    required super.id,
    required super.name,
    required super.x,
    required super.y,
    required super.width,
    required super.height,
    required super.text,
    required bool wrap,
  }) : super(wrapText: wrap);
}

class VObjectTile extends VObject {
  VObjectTile({
    required super.id,
    required super.gid,
    required super.name,
    required super.x,
    required super.y,
    required super.width,
    required super.height,
  }) : super(tile: true);
}
