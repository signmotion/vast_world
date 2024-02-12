//
//  Generated code. Do not modify.
//  source: vw/hermes/client_state.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use clientStateBaseDescriptor instead')
const ClientStateBase$json = {
  '1': 'ClientStateBase',
  '2': [
    {'1': 'state', '3': 1, '4': 1, '5': 14, '6': '.vw.hermes.ClientStateEnumBase', '10': 'state'},
    {'1': 'uidDevice', '3': 2, '4': 1, '5': 9, '10': 'uidDevice'},
    {'1': 'session', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'session', '17': true},
    {'1': 'session_approved', '3': 4, '4': 1, '5': 8, '9': 1, '10': 'sessionApproved', '17': true},
    {'1': 'name_server', '3': 100, '4': 1, '5': 9, '9': 2, '10': 'nameServer', '17': true},
    {'1': 'current_plan_id', '3': 200, '4': 1, '5': 9, '10': 'currentPlanId'},
  ],
  '8': [
    {'1': '_session'},
    {'1': '_session_approved'},
    {'1': '_name_server'},
  ],
};

/// Descriptor for `ClientStateBase`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List clientStateBaseDescriptor = $convert.base64Decode(
    'Cg9DbGllbnRTdGF0ZUJhc2USNAoFc3RhdGUYASABKA4yHi52dy5oZXJtZXMuQ2xpZW50U3RhdG'
    'VFbnVtQmFzZVIFc3RhdGUSHAoJdWlkRGV2aWNlGAIgASgJUgl1aWREZXZpY2USHQoHc2Vzc2lv'
    'bhgDIAEoCUgAUgdzZXNzaW9uiAEBEi4KEHNlc3Npb25fYXBwcm92ZWQYBCABKAhIAVIPc2Vzc2'
    'lvbkFwcHJvdmVkiAEBEiQKC25hbWVfc2VydmVyGGQgASgJSAJSCm5hbWVTZXJ2ZXKIAQESJwoP'
    'Y3VycmVudF9wbGFuX2lkGMgBIAEoCVINY3VycmVudFBsYW5JZEIKCghfc2Vzc2lvbkITChFfc2'
    'Vzc2lvbl9hcHByb3ZlZEIOCgxfbmFtZV9zZXJ2ZXI=');

