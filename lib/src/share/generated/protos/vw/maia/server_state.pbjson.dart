//
//  Generated code. Do not modify.
//  source: vw/maia/server_state.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use serverStateBaseDescriptor instead')
const ServerStateBase$json = {
  '1': 'ServerStateBase',
  '2': [
    {'1': 'options', '3': 1, '4': 3, '5': 11, '6': '.vw.maia.ServerStateBase.OptionsEntry', '10': 'options'},
    {'1': 'claimed_sessions_devices', '3': 2, '4': 3, '5': 11, '6': '.vw.maia.ServerStateBase.ClaimedSessionsDevicesEntry', '10': 'claimedSessionsDevices'},
    {'1': 'approved_sessions', '3': 3, '4': 3, '5': 11, '6': '.vw.maia.ServerStateBase.ApprovedSessionsEntry', '10': 'approvedSessions'},
    {'1': 'current_plan_ids', '3': 200, '4': 3, '5': 11, '6': '.vw.maia.ServerStateBase.CurrentPlanIdsEntry', '10': 'currentPlanIds'},
  ],
  '3': [ServerStateBase_OptionsEntry$json, ServerStateBase_ClaimedSessionsDevicesEntry$json, ServerStateBase_ApprovedSessionsEntry$json, ServerStateBase_CurrentPlanIdsEntry$json],
};

@$core.Deprecated('Use serverStateBaseDescriptor instead')
const ServerStateBase_OptionsEntry$json = {
  '1': 'OptionsEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.vw.maia.ServerOptionsBase', '10': 'value'},
  ],
  '7': {'7': true},
};

@$core.Deprecated('Use serverStateBaseDescriptor instead')
const ServerStateBase_ClaimedSessionsDevicesEntry$json = {
  '1': 'ClaimedSessionsDevicesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

@$core.Deprecated('Use serverStateBaseDescriptor instead')
const ServerStateBase_ApprovedSessionsEntry$json = {
  '1': 'ApprovedSessionsEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 8, '10': 'value'},
  ],
  '7': {'7': true},
};

@$core.Deprecated('Use serverStateBaseDescriptor instead')
const ServerStateBase_CurrentPlanIdsEntry$json = {
  '1': 'CurrentPlanIdsEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `ServerStateBase`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List serverStateBaseDescriptor = $convert.base64Decode(
    'Cg9TZXJ2ZXJTdGF0ZUJhc2USPwoHb3B0aW9ucxgBIAMoCzIlLnZ3Lm1haWEuU2VydmVyU3RhdG'
    'VCYXNlLk9wdGlvbnNFbnRyeVIHb3B0aW9ucxJuChhjbGFpbWVkX3Nlc3Npb25zX2RldmljZXMY'
    'AiADKAsyNC52dy5tYWlhLlNlcnZlclN0YXRlQmFzZS5DbGFpbWVkU2Vzc2lvbnNEZXZpY2VzRW'
    '50cnlSFmNsYWltZWRTZXNzaW9uc0RldmljZXMSWwoRYXBwcm92ZWRfc2Vzc2lvbnMYAyADKAsy'
    'Li52dy5tYWlhLlNlcnZlclN0YXRlQmFzZS5BcHByb3ZlZFNlc3Npb25zRW50cnlSEGFwcHJvdm'
    'VkU2Vzc2lvbnMSVwoQY3VycmVudF9wbGFuX2lkcxjIASADKAsyLC52dy5tYWlhLlNlcnZlclN0'
    'YXRlQmFzZS5DdXJyZW50UGxhbklkc0VudHJ5Ug5jdXJyZW50UGxhbklkcxpWCgxPcHRpb25zRW'
    '50cnkSEAoDa2V5GAEgASgJUgNrZXkSMAoFdmFsdWUYAiABKAsyGi52dy5tYWlhLlNlcnZlck9w'
    'dGlvbnNCYXNlUgV2YWx1ZToCOAEaSQobQ2xhaW1lZFNlc3Npb25zRGV2aWNlc0VudHJ5EhAKA2'
    'tleRgBIAEoCVIDa2V5EhQKBXZhbHVlGAIgASgJUgV2YWx1ZToCOAEaQwoVQXBwcm92ZWRTZXNz'
    'aW9uc0VudHJ5EhAKA2tleRgBIAEoCVIDa2V5EhQKBXZhbHVlGAIgASgIUgV2YWx1ZToCOAEaQQ'
    'oTQ3VycmVudFBsYW5JZHNFbnRyeRIQCgNrZXkYASABKAlSA2tleRIUCgV2YWx1ZRgCIAEoCVIF'
    'dmFsdWU6AjgB');

