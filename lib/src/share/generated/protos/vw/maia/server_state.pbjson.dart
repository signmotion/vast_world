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
    {'1': 'options', '3': 1, '4': 1, '5': 11, '6': '.vw.maia.ServerOptionsBase', '10': 'options'},
    {'1': 'claimed_sessions_devices', '3': 2, '4': 3, '5': 11, '6': '.vw.maia.ServerStateBase.ClaimedSessionsDevicesEntry', '10': 'claimedSessionsDevices'},
    {'1': 'approved_sessions', '3': 3, '4': 3, '5': 11, '6': '.vw.maia.ServerStateBase.ApprovedSessionsEntry', '10': 'approvedSessions'},
    {'1': 'current_plan_ids', '3': 200, '4': 3, '5': 11, '6': '.vw.maia.ServerStateBase.CurrentPlanIdsEntry', '10': 'currentPlanIds'},
    {'1': 'runes', '3': 210, '4': 3, '5': 11, '6': '.vw.maia.ServerStateBase.RunesEntry', '10': 'runes'},
  ],
  '3': [ServerStateBase_ClaimedSessionsDevicesEntry$json, ServerStateBase_ApprovedSessionsEntry$json, ServerStateBase_CurrentPlanIdsEntry$json, ServerStateBase_RunesEntry$json],
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

@$core.Deprecated('Use serverStateBaseDescriptor instead')
const ServerStateBase_RunesEntry$json = {
  '1': 'RunesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.vw.runes.share.AllContentsBase', '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `ServerStateBase`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List serverStateBaseDescriptor = $convert.base64Decode(
    'Cg9TZXJ2ZXJTdGF0ZUJhc2USNAoHb3B0aW9ucxgBIAEoCzIaLnZ3Lm1haWEuU2VydmVyT3B0aW'
    '9uc0Jhc2VSB29wdGlvbnMSbgoYY2xhaW1lZF9zZXNzaW9uc19kZXZpY2VzGAIgAygLMjQudncu'
    'bWFpYS5TZXJ2ZXJTdGF0ZUJhc2UuQ2xhaW1lZFNlc3Npb25zRGV2aWNlc0VudHJ5UhZjbGFpbW'
    'VkU2Vzc2lvbnNEZXZpY2VzElsKEWFwcHJvdmVkX3Nlc3Npb25zGAMgAygLMi4udncubWFpYS5T'
    'ZXJ2ZXJTdGF0ZUJhc2UuQXBwcm92ZWRTZXNzaW9uc0VudHJ5UhBhcHByb3ZlZFNlc3Npb25zEl'
    'cKEGN1cnJlbnRfcGxhbl9pZHMYyAEgAygLMiwudncubWFpYS5TZXJ2ZXJTdGF0ZUJhc2UuQ3Vy'
    'cmVudFBsYW5JZHNFbnRyeVIOY3VycmVudFBsYW5JZHMSOgoFcnVuZXMY0gEgAygLMiMudncubW'
    'FpYS5TZXJ2ZXJTdGF0ZUJhc2UuUnVuZXNFbnRyeVIFcnVuZXMaSQobQ2xhaW1lZFNlc3Npb25z'
    'RGV2aWNlc0VudHJ5EhAKA2tleRgBIAEoCVIDa2V5EhQKBXZhbHVlGAIgASgJUgV2YWx1ZToCOA'
    'EaQwoVQXBwcm92ZWRTZXNzaW9uc0VudHJ5EhAKA2tleRgBIAEoCVIDa2V5EhQKBXZhbHVlGAIg'
    'ASgIUgV2YWx1ZToCOAEaQQoTQ3VycmVudFBsYW5JZHNFbnRyeRIQCgNrZXkYASABKAlSA2tleR'
    'IUCgV2YWx1ZRgCIAEoCVIFdmFsdWU6AjgBGlkKClJ1bmVzRW50cnkSEAoDa2V5GAEgASgJUgNr'
    'ZXkSNQoFdmFsdWUYAiABKAsyHy52dy5ydW5lcy5zaGFyZS5BbGxDb250ZW50c0Jhc2VSBXZhbH'
    'VlOgI4AQ==');

