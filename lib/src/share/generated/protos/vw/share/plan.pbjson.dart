//
//  Generated code. Do not modify.
//  source: vw/share/plan.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use planBaseDescriptor instead')
const PlanBase$json = {
  '1': 'PlanBase',
  '2': [
    {'1': 'hid', '3': 1, '4': 1, '5': 9, '10': 'hid'},
    {'1': 'uid', '3': 2, '4': 1, '5': 9, '10': 'uid'},
    {'1': 'components', '3': 10, '4': 3, '5': 11, '6': '.vw.share.PlanBase.ComponentsEntry', '10': 'components'},
    {'1': 'exposed', '3': 12, '4': 3, '5': 11, '6': '.vw.share.PlanBase.ExposedEntry', '10': 'exposed'},
  ],
  '3': [PlanBase_ComponentsEntry$json, PlanBase_ExposedEntry$json],
};

@$core.Deprecated('Use planBaseDescriptor instead')
const PlanBase_ComponentsEntry$json = {
  '1': 'ComponentsEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.vw.share.ComponentBase', '10': 'value'},
  ],
  '7': {'7': true},
};

@$core.Deprecated('Use planBaseDescriptor instead')
const PlanBase_ExposedEntry$json = {
  '1': 'ExposedEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.vw.share.PlanBase', '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `PlanBase`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List planBaseDescriptor = $convert.base64Decode(
    'CghQbGFuQmFzZRIQCgNoaWQYASABKAlSA2hpZBIQCgN1aWQYAiABKAlSA3VpZBJCCgpjb21wb2'
    '5lbnRzGAogAygLMiIudncuc2hhcmUuUGxhbkJhc2UuQ29tcG9uZW50c0VudHJ5Ugpjb21wb25l'
    'bnRzEjkKB2V4cG9zZWQYDCADKAsyHy52dy5zaGFyZS5QbGFuQmFzZS5FeHBvc2VkRW50cnlSB2'
    'V4cG9zZWQaVgoPQ29tcG9uZW50c0VudHJ5EhAKA2tleRgBIAEoCVIDa2V5Ei0KBXZhbHVlGAIg'
    'ASgLMhcudncuc2hhcmUuQ29tcG9uZW50QmFzZVIFdmFsdWU6AjgBGk4KDEV4cG9zZWRFbnRyeR'
    'IQCgNrZXkYASABKAlSA2tleRIoCgV2YWx1ZRgCIAEoCzISLnZ3LnNoYXJlLlBsYW5CYXNlUgV2'
    'YWx1ZToCOAE=');

