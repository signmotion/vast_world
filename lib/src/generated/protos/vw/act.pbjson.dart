//
//  Generated code. Do not modify.
//  source: vw/act.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use actBaseDescriptor instead')
const ActBase$json = {
  '1': 'ActBase',
  '2': [
    {'1': 'debug_name', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'debugName', '17': true},
    {'1': 'uid', '3': 2, '4': 1, '5': 9, '10': 'uid'},
    {'1': 'type', '3': 6, '4': 1, '5': 14, '6': '.vw.ActTypeEnumBase', '10': 'type'},
    {'1': 'plan_id', '3': 12, '4': 1, '5': 9, '9': 1, '10': 'planId', '17': true},
    {'1': 'values', '3': 13, '4': 3, '5': 11, '6': '.vw.ActBase.ValuesEntry', '10': 'values'},
  ],
  '3': [ActBase_ValuesEntry$json],
  '8': [
    {'1': '_debug_name'},
    {'1': '_plan_id'},
  ],
};

@$core.Deprecated('Use actBaseDescriptor instead')
const ActBase_ValuesEntry$json = {
  '1': 'ValuesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `ActBase`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List actBaseDescriptor = $convert.base64Decode(
    'CgdBY3RCYXNlEiIKCmRlYnVnX25hbWUYASABKAlIAFIJZGVidWdOYW1liAEBEhAKA3VpZBgCIA'
    'EoCVIDdWlkEicKBHR5cGUYBiABKA4yEy52dy5BY3RUeXBlRW51bUJhc2VSBHR5cGUSHAoHcGxh'
    'bl9pZBgMIAEoCUgBUgZwbGFuSWSIAQESLwoGdmFsdWVzGA0gAygLMhcudncuQWN0QmFzZS5WYW'
    'x1ZXNFbnRyeVIGdmFsdWVzGjkKC1ZhbHVlc0VudHJ5EhAKA2tleRgBIAEoCVIDa2V5EhQKBXZh'
    'bHVlGAIgASgJUgV2YWx1ZToCOAFCDQoLX2RlYnVnX25hbWVCCgoIX3BsYW5faWQ=');

