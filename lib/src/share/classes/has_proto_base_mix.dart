part of '../../../vast_world_share.dart';

mixin HasProtoBaseMix on Object {
  GeneratedMessage get base;

  JsonMap get baseAsJson => base.toProto3Json() as JsonMap;

  GeneratedMessage jsonAsBase(JsonMap json);

  @override
  String toString() => '${base.mapWithSignificantFieldsMessage}'
      .bittenOfAllUuids32
      .abbreviate(120);
}
