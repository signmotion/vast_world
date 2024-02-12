//
//  Generated code. Do not modify.
//  source: vw/runes/fantasy_country_conceiver/service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use promptRequestDescriptor instead')
const PromptRequest$json = {
  '1': 'PromptRequest',
  '2': [
    {'1': 'prompt', '3': 1, '4': 1, '5': 9, '10': 'prompt'},
    {'1': 'session', '3': 3, '4': 1, '5': 9, '10': 'session'},
  ],
};

/// Descriptor for `PromptRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List promptRequestDescriptor = $convert.base64Decode(
    'Cg1Qcm9tcHRSZXF1ZXN0EhYKBnByb21wdBgBIAEoCVIGcHJvbXB0EhgKB3Nlc3Npb24YAyABKA'
    'lSB3Nlc3Npb24=');

@$core.Deprecated('Use imageResponseDescriptor instead')
const ImageResponse$json = {
  '1': 'ImageResponse',
  '2': [
    {'1': 'image', '3': 1, '4': 1, '5': 11, '6': '.syrokomskyi.type.Image', '10': 'image'},
    {'1': 'answer', '3': 100, '4': 1, '5': 11, '6': '.vw.runes.fantasy_country_conceiver.ServerAnswer', '10': 'answer'},
  ],
};

/// Descriptor for `ImageResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List imageResponseDescriptor = $convert.base64Decode(
    'Cg1JbWFnZVJlc3BvbnNlEi0KBWltYWdlGAEgASgLMhcuc3lyb2tvbXNreWkudHlwZS5JbWFnZV'
    'IFaW1hZ2USSAoGYW5zd2VyGGQgASgLMjAudncucnVuZXMuZmFudGFzeV9jb3VudHJ5X2NvbmNl'
    'aXZlci5TZXJ2ZXJBbnN3ZXJSBmFuc3dlcg==');

@$core.Deprecated('Use jsonResponseDescriptor instead')
const JsonResponse$json = {
  '1': 'JsonResponse',
  '2': [
    {'1': 'json', '3': 1, '4': 3, '5': 11, '6': '.vw.runes.fantasy_country_conceiver.JsonResponse.JsonEntry', '10': 'json'},
    {'1': 'answer', '3': 100, '4': 1, '5': 11, '6': '.vw.runes.fantasy_country_conceiver.ServerAnswer', '10': 'answer'},
  ],
  '3': [JsonResponse_JsonEntry$json],
};

@$core.Deprecated('Use jsonResponseDescriptor instead')
const JsonResponse_JsonEntry$json = {
  '1': 'JsonEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `JsonResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List jsonResponseDescriptor = $convert.base64Decode(
    'CgxKc29uUmVzcG9uc2USTgoEanNvbhgBIAMoCzI6LnZ3LnJ1bmVzLmZhbnRhc3lfY291bnRyeV'
    '9jb25jZWl2ZXIuSnNvblJlc3BvbnNlLkpzb25FbnRyeVIEanNvbhJICgZhbnN3ZXIYZCABKAsy'
    'MC52dy5ydW5lcy5mYW50YXN5X2NvdW50cnlfY29uY2VpdmVyLlNlcnZlckFuc3dlclIGYW5zd2'
    'VyGjcKCUpzb25FbnRyeRIQCgNrZXkYASABKAlSA2tleRIUCgV2YWx1ZRgCIAEoCVIFdmFsdWU6'
    'AjgB');

@$core.Deprecated('Use textResponseDescriptor instead')
const TextResponse$json = {
  '1': 'TextResponse',
  '2': [
    {'1': 'text', '3': 1, '4': 1, '5': 9, '10': 'text'},
    {'1': 'answer', '3': 100, '4': 1, '5': 11, '6': '.vw.runes.fantasy_country_conceiver.ServerAnswer', '10': 'answer'},
  ],
};

/// Descriptor for `TextResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List textResponseDescriptor = $convert.base64Decode(
    'CgxUZXh0UmVzcG9uc2USEgoEdGV4dBgBIAEoCVIEdGV4dBJICgZhbnN3ZXIYZCABKAsyMC52dy'
    '5ydW5lcy5mYW50YXN5X2NvdW50cnlfY29uY2VpdmVyLlNlcnZlckFuc3dlclIGYW5zd2Vy');

@$core.Deprecated('Use serverAnswerDescriptor instead')
const ServerAnswer$json = {
  '1': 'ServerAnswer',
  '2': [
    {'1': 'session', '3': 3, '4': 1, '5': 9, '10': 'session'},
    {'1': 'type', '3': 10, '4': 1, '5': 14, '6': '.vw.maia.ServerAnswerTypeEnumBase', '10': 'type'},
    {'1': 'code_explain', '3': 11, '4': 1, '5': 14, '6': '.vw.share.ErrorExplainEnumBase', '10': 'codeExplain'},
    {'1': 'message_explain', '3': 12, '4': 1, '5': 9, '10': 'messageExplain'},
  ],
};

/// Descriptor for `ServerAnswer`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List serverAnswerDescriptor = $convert.base64Decode(
    'CgxTZXJ2ZXJBbnN3ZXISGAoHc2Vzc2lvbhgDIAEoCVIHc2Vzc2lvbhI1CgR0eXBlGAogASgOMi'
    'EudncubWFpYS5TZXJ2ZXJBbnN3ZXJUeXBlRW51bUJhc2VSBHR5cGUSQQoMY29kZV9leHBsYWlu'
    'GAsgASgOMh4udncuc2hhcmUuRXJyb3JFeHBsYWluRW51bUJhc2VSC2NvZGVFeHBsYWluEicKD2'
    '1lc3NhZ2VfZXhwbGFpbhgMIAEoCVIObWVzc2FnZUV4cGxhaW4=');

