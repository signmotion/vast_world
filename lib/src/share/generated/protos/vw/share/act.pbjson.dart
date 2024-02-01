//
//  Generated code. Do not modify.
//  source: vw/share/act.proto
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
    {'1': 'type', '3': 6, '4': 1, '5': 14, '6': '.vw.share.ActTypeEnumBase', '10': 'type'},
    {'1': 'plan_id', '3': 12, '4': 1, '5': 9, '9': 1, '10': 'planId', '17': true},
    {'1': 'components', '3': 13, '4': 3, '5': 11, '6': '.vw.share.ActBase.ComponentsEntry', '10': 'components'},
  ],
  '3': [ActBase_ComponentsEntry$json],
  '8': [
    {'1': '_debug_name'},
    {'1': '_plan_id'},
  ],
};

@$core.Deprecated('Use actBaseDescriptor instead')
const ActBase_ComponentsEntry$json = {
  '1': 'ComponentsEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.vw.share.ComponentBase', '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `ActBase`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List actBaseDescriptor = $convert.base64Decode(
    'CgdBY3RCYXNlEiIKCmRlYnVnX25hbWUYASABKAlIAFIJZGVidWdOYW1liAEBEhAKA3VpZBgCIA'
    'EoCVIDdWlkEi0KBHR5cGUYBiABKA4yGS52dy5zaGFyZS5BY3RUeXBlRW51bUJhc2VSBHR5cGUS'
    'HAoHcGxhbl9pZBgMIAEoCUgBUgZwbGFuSWSIAQESQQoKY29tcG9uZW50cxgNIAMoCzIhLnZ3Ln'
    'NoYXJlLkFjdEJhc2UuQ29tcG9uZW50c0VudHJ5Ugpjb21wb25lbnRzGlYKD0NvbXBvbmVudHNF'
    'bnRyeRIQCgNrZXkYASABKAlSA2tleRItCgV2YWx1ZRgCIAEoCzIXLnZ3LnNoYXJlLkNvbXBvbm'
    'VudEJhc2VSBXZhbHVlOgI4AUINCgtfZGVidWdfbmFtZUIKCghfcGxhbl9pZA==');

