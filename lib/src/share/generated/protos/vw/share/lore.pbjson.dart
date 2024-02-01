//
//  Generated code. Do not modify.
//  source: vw/share/lore.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use loreBaseDescriptor instead')
const LoreBase$json = {
  '1': 'LoreBase',
  '2': [
    {'1': 'plans', '3': 10, '4': 3, '5': 11, '6': '.vw.share.LoreBase.PlansEntry', '10': 'plans'},
  ],
  '3': [LoreBase_PlansEntry$json],
};

@$core.Deprecated('Use loreBaseDescriptor instead')
const LoreBase_PlansEntry$json = {
  '1': 'PlansEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.vw.share.PlanBase', '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `LoreBase`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loreBaseDescriptor = $convert.base64Decode(
    'CghMb3JlQmFzZRIzCgVwbGFucxgKIAMoCzIdLnZ3LnNoYXJlLkxvcmVCYXNlLlBsYW5zRW50cn'
    'lSBXBsYW5zGkwKClBsYW5zRW50cnkSEAoDa2V5GAEgASgJUgNrZXkSKAoFdmFsdWUYAiABKAsy'
    'Ei52dy5zaGFyZS5QbGFuQmFzZVIFdmFsdWU6AjgB');

