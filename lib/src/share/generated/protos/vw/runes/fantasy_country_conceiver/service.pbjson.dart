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

@$core.Deprecated('Use conceivingNameAndIdJourneyResponseDescriptor instead')
const ConceivingNameAndIdJourneyResponse$json = {
  '1': 'ConceivingNameAndIdJourneyResponse',
  '2': [
    {'1': 'plan_hid', '3': 1, '4': 1, '5': 9, '10': 'planHid'},
    {'1': 'plan_uid', '3': 2, '4': 1, '5': 9, '10': 'planUid'},
    {'1': 'title', '3': 12, '4': 1, '5': 9, '10': 'title'},
    {'1': 'synopsis', '3': 13, '4': 1, '5': 9, '10': 'synopsis'},
    {'1': 'answer', '3': 100, '4': 1, '5': 11, '6': '.vw.share.ServerAnswer', '10': 'answer'},
  ],
};

/// Descriptor for `ConceivingNameAndIdJourneyResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List conceivingNameAndIdJourneyResponseDescriptor = $convert.base64Decode(
    'CiJDb25jZWl2aW5nTmFtZUFuZElkSm91cm5leVJlc3BvbnNlEhkKCHBsYW5faGlkGAEgASgJUg'
    'dwbGFuSGlkEhkKCHBsYW5fdWlkGAIgASgJUgdwbGFuVWlkEhQKBXRpdGxlGAwgASgJUgV0aXRs'
    'ZRIaCghzeW5vcHNpcxgNIAEoCVIIc3lub3BzaXMSLgoGYW5zd2VyGGQgASgLMhYudncuc2hhcm'
    'UuU2VydmVyQW5zd2VyUgZhbnN3ZXI=');

@$core.Deprecated('Use conceivingNameAndIdPlaceResponseDescriptor instead')
const ConceivingNameAndIdPlaceResponse$json = {
  '1': 'ConceivingNameAndIdPlaceResponse',
  '2': [
    {'1': 'plan_hid', '3': 1, '4': 1, '5': 9, '10': 'planHid'},
    {'1': 'plan_uid', '3': 2, '4': 1, '5': 9, '10': 'planUid'},
    {'1': 'title', '3': 12, '4': 1, '5': 9, '10': 'title'},
    {'1': 'description', '3': 13, '4': 1, '5': 9, '10': 'description'},
    {'1': 'predominant_colors', '3': 20, '4': 3, '5': 11, '6': '.vw.runes.fantasy_country_conceiver.ConceivingNameAndIdPlaceResponse.PredominantColorsEntry', '10': 'predominantColors'},
    {'1': 'answer', '3': 100, '4': 1, '5': 11, '6': '.vw.share.ServerAnswer', '10': 'answer'},
  ],
  '3': [ConceivingNameAndIdPlaceResponse_PredominantColorsEntry$json],
};

@$core.Deprecated('Use conceivingNameAndIdPlaceResponseDescriptor instead')
const ConceivingNameAndIdPlaceResponse_PredominantColorsEntry$json = {
  '1': 'PredominantColorsEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `ConceivingNameAndIdPlaceResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List conceivingNameAndIdPlaceResponseDescriptor = $convert.base64Decode(
    'CiBDb25jZWl2aW5nTmFtZUFuZElkUGxhY2VSZXNwb25zZRIZCghwbGFuX2hpZBgBIAEoCVIHcG'
    'xhbkhpZBIZCghwbGFuX3VpZBgCIAEoCVIHcGxhblVpZBIUCgV0aXRsZRgMIAEoCVIFdGl0bGUS'
    'IAoLZGVzY3JpcHRpb24YDSABKAlSC2Rlc2NyaXB0aW9uEooBChJwcmVkb21pbmFudF9jb2xvcn'
    'MYFCADKAsyWy52dy5ydW5lcy5mYW50YXN5X2NvdW50cnlfY29uY2VpdmVyLkNvbmNlaXZpbmdO'
    'YW1lQW5kSWRQbGFjZVJlc3BvbnNlLlByZWRvbWluYW50Q29sb3JzRW50cnlSEXByZWRvbWluYW'
    '50Q29sb3JzEi4KBmFuc3dlchhkIAEoCzIWLnZ3LnNoYXJlLlNlcnZlckFuc3dlclIGYW5zd2Vy'
    'GkQKFlByZWRvbWluYW50Q29sb3JzRW50cnkSEAoDa2V5GAEgASgJUgNrZXkSFAoFdmFsdWUYAi'
    'ABKAlSBXZhbHVlOgI4AQ==');

