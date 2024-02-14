//
//  Generated code. Do not modify.
//  source: vw/runes/fantasy_journey_conceiver/services/place.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use conceiveNameAndIdPlaceResponseDescriptor instead')
const conceiveNameAndIdPlaceResponse$json = {
  '1': 'conceiveNameAndIdPlaceResponse',
  '2': [
    {'1': 'plan_hid', '3': 1, '4': 1, '5': 9, '10': 'planHid'},
    {'1': 'plan_uid', '3': 2, '4': 1, '5': 9, '10': 'planUid'},
    {'1': 'title', '3': 12, '4': 1, '5': 9, '10': 'title'},
    {'1': 'description', '3': 13, '4': 1, '5': 9, '10': 'description'},
    {'1': 'predominant_colors', '3': 20, '4': 3, '5': 11, '6': '.vw.runes.fantasy_journey_conceiver.conceiveNameAndIdPlaceResponse.PredominantColorsEntry', '10': 'predominantColors'},
    {'1': 'answer', '3': 100, '4': 1, '5': 11, '6': '.vw.share.ServerAnswer', '10': 'answer'},
  ],
  '3': [conceiveNameAndIdPlaceResponse_PredominantColorsEntry$json],
};

@$core.Deprecated('Use conceiveNameAndIdPlaceResponseDescriptor instead')
const conceiveNameAndIdPlaceResponse_PredominantColorsEntry$json = {
  '1': 'PredominantColorsEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `conceiveNameAndIdPlaceResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List conceiveNameAndIdPlaceResponseDescriptor = $convert.base64Decode(
    'Ch5jb25jZWl2ZU5hbWVBbmRJZFBsYWNlUmVzcG9uc2USGQoIcGxhbl9oaWQYASABKAlSB3BsYW'
    '5IaWQSGQoIcGxhbl91aWQYAiABKAlSB3BsYW5VaWQSFAoFdGl0bGUYDCABKAlSBXRpdGxlEiAK'
    'C2Rlc2NyaXB0aW9uGA0gASgJUgtkZXNjcmlwdGlvbhKIAQoScHJlZG9taW5hbnRfY29sb3JzGB'
    'QgAygLMlkudncucnVuZXMuZmFudGFzeV9qb3VybmV5X2NvbmNlaXZlci5jb25jZWl2ZU5hbWVB'
    'bmRJZFBsYWNlUmVzcG9uc2UuUHJlZG9taW5hbnRDb2xvcnNFbnRyeVIRcHJlZG9taW5hbnRDb2'
    'xvcnMSLgoGYW5zd2VyGGQgASgLMhYudncuc2hhcmUuU2VydmVyQW5zd2VyUgZhbnN3ZXIaRAoW'
    'UHJlZG9taW5hbnRDb2xvcnNFbnRyeRIQCgNrZXkYASABKAlSA2tleRIUCgV2YWx1ZRgCIAEoCV'
    'IFdmFsdWU6AjgB');

