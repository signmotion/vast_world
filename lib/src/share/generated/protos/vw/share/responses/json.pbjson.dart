//
//  Generated code. Do not modify.
//  source: vw/share/responses/json.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use jsonResponseDescriptor instead')
const JsonResponse$json = {
  '1': 'JsonResponse',
  '2': [
    {'1': 'json', '3': 1, '4': 3, '5': 11, '6': '.vw.share.responses.JsonResponse.JsonEntry', '10': 'json'},
    {'1': 'answer', '3': 100, '4': 1, '5': 11, '6': '.vw.share.ServerAnswer', '10': 'answer'},
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
    'CgxKc29uUmVzcG9uc2USPgoEanNvbhgBIAMoCzIqLnZ3LnNoYXJlLnJlc3BvbnNlcy5Kc29uUm'
    'VzcG9uc2UuSnNvbkVudHJ5UgRqc29uEi4KBmFuc3dlchhkIAEoCzIWLnZ3LnNoYXJlLlNlcnZl'
    'ckFuc3dlclIGYW5zd2VyGjcKCUpzb25FbnRyeRIQCgNrZXkYASABKAlSA2tleRIUCgV2YWx1ZR'
    'gCIAEoCVIFdmFsdWU6AjgB');

