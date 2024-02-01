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

extension ConvertListGeneratedMessageExt on List<GeneratedMessage> {
  List<String> get sShortMapWithSignificantFieldsMessage =>
      map((e) => e.sShortMapWithSignificantFieldsMessage).toList();
  List<JsonMap> get shortMapWithSignificantFieldsMessage =>
      map((e) => e.shortMapWithSignificantFieldsMessage).toList();

  List<String> get sMapWithSignificantFieldsMessage =>
      map((e) => e.sMapWithSignificantFieldsMessage).toList();
  List<JsonMap> get mapWithSignificantFieldsMessage =>
      map((e) => e.mapWithSignificantFieldsMessage).toList();
}
