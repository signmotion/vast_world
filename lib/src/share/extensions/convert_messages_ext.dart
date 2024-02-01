part of '../../../vast_world_share.dart';

extension ConvertGeneratedMessageExt on GeneratedMessage {
  String get sMapMessage => mapMessage.sjson;
  JsonMap get mapMessage => toProto3Json() as JsonMap;

  String get sShortMapWithSignificantFieldsMessage =>
      '$shortMapWithSignificantFieldsMessage'.sjsonWithoutWrappers;
  JsonMap get shortMapWithSignificantFieldsMessage =>
      mapWithSignificantFieldsMessage.bittenOfAllUuids32..remove('created');

  String get sMapWithSignificantFieldsMessage =>
      '$mapWithSignificantFieldsMessage'.sjsonWithoutWrappers;
  JsonMap get mapWithSignificantFieldsMessage =>
      mapMessage.jsonWithSignificantFields.blured();
}

extension ConvertListGeneratedMessageExt on Iterable<GeneratedMessage> {
  Iterable<String> get sShortMapWithSignificantFieldsMessage =>
      map((e) => e.sShortMapWithSignificantFieldsMessage);
  Iterable<JsonMap> get shortMapWithSignificantFieldsMessage =>
      map((e) => e.shortMapWithSignificantFieldsMessage);

  Iterable<String> get sMapWithSignificantFieldsMessage =>
      map((e) => e.sMapWithSignificantFieldsMessage);
  Iterable<JsonMap> get mapWithSignificantFieldsMessage =>
      map((e) => e.mapWithSignificantFieldsMessage);
}
