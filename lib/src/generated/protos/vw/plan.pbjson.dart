//
//  Generated code. Do not modify.
//  source: vw/plan.proto
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
    {'1': 'components', '3': 10, '4': 3, '5': 11, '6': '.vw.PlanBase.ComponentsEntry', '10': 'components'},
    {'1': 'exposed', '3': 12, '4': 3, '5': 11, '6': '.vw.PlanBase.ExposedEntry', '10': 'exposed'},
  ],
  '3': [PlanBase_ComponentsEntry$json, PlanBase_ExposedEntry$json],
};

@$core.Deprecated('Use planBaseDescriptor instead')
const PlanBase_ComponentsEntry$json = {
  '1': 'ComponentsEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.vw.ComponentBase', '10': 'value'},
  ],
  '7': {'7': true},
};

@$core.Deprecated('Use planBaseDescriptor instead')
const PlanBase_ExposedEntry$json = {
  '1': 'ExposedEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.vw.PlanBase', '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `PlanBase`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List planBaseDescriptor = $convert.base64Decode(
    'CghQbGFuQmFzZRIQCgNoaWQYASABKAlSA2hpZBIQCgN1aWQYAiABKAlSA3VpZBI8Cgpjb21wb2'
    '5lbnRzGAogAygLMhwudncuUGxhbkJhc2UuQ29tcG9uZW50c0VudHJ5Ugpjb21wb25lbnRzEjMK'
    'B2V4cG9zZWQYDCADKAsyGS52dy5QbGFuQmFzZS5FeHBvc2VkRW50cnlSB2V4cG9zZWQaUAoPQ2'
    '9tcG9uZW50c0VudHJ5EhAKA2tleRgBIAEoCVIDa2V5EicKBXZhbHVlGAIgASgLMhEudncuQ29t'
    'cG9uZW50QmFzZVIFdmFsdWU6AjgBGkgKDEV4cG9zZWRFbnRyeRIQCgNrZXkYASABKAlSA2tleR'
    'IiCgV2YWx1ZRgCIAEoCzIMLnZ3LlBsYW5CYXNlUgV2YWx1ZToCOAE=');

