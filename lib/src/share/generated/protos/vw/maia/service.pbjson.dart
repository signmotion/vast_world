//
//  Generated code. Do not modify.
//  source: vw/maia/service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use claimSessionRequestDescriptor instead')
const ClaimSessionRequest$json = {
  '1': 'ClaimSessionRequest',
  '2': [
    {'1': 'fixed_session', '3': 6, '4': 1, '5': 8, '10': 'fixedSession'},
    {'1': 'uid_device', '3': 4, '4': 1, '5': 9, '10': 'uidDevice'},
    {'1': 'options', '3': 5, '4': 1, '5': 11, '6': '.vw.maia.ServerOptionsBase', '10': 'options'},
  ],
};

/// Descriptor for `ClaimSessionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List claimSessionRequestDescriptor = $convert.base64Decode(
    'ChNDbGFpbVNlc3Npb25SZXF1ZXN0EiMKDWZpeGVkX3Nlc3Npb24YBiABKAhSDGZpeGVkU2Vzc2'
    'lvbhIdCgp1aWRfZGV2aWNlGAQgASgJUgl1aWREZXZpY2USNAoHb3B0aW9ucxgFIAEoCzIaLnZ3'
    'Lm1haWEuU2VydmVyT3B0aW9uc0Jhc2VSB29wdGlvbnM=');

@$core.Deprecated('Use claimSessionResponseDescriptor instead')
const ClaimSessionResponse$json = {
  '1': 'ClaimSessionResponse',
  '2': [
    {'1': 'issued_session', '3': 3, '4': 1, '5': 9, '10': 'issuedSession'},
  ],
};

/// Descriptor for `ClaimSessionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List claimSessionResponseDescriptor = $convert.base64Decode(
    'ChRDbGFpbVNlc3Npb25SZXNwb25zZRIlCg5pc3N1ZWRfc2Vzc2lvbhgDIAEoCVINaXNzdWVkU2'
    'Vzc2lvbg==');

@$core.Deprecated('Use approveSessionRequestDescriptor instead')
const ApproveSessionRequest$json = {
  '1': 'ApproveSessionRequest',
  '2': [
    {'1': 'session', '3': 3, '4': 1, '5': 9, '10': 'session'},
    {'1': 'uid_device', '3': 4, '4': 1, '5': 9, '10': 'uidDevice'},
  ],
};

/// Descriptor for `ApproveSessionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List approveSessionRequestDescriptor = $convert.base64Decode(
    'ChVBcHByb3ZlU2Vzc2lvblJlcXVlc3QSGAoHc2Vzc2lvbhgDIAEoCVIHc2Vzc2lvbhIdCgp1aW'
    'RfZGV2aWNlGAQgASgJUgl1aWREZXZpY2U=');

@$core.Deprecated('Use approveSessionResponseDescriptor instead')
const ApproveSessionResponse$json = {
  '1': 'ApproveSessionResponse',
  '2': [
    {'1': 'approved', '3': 1, '4': 1, '5': 8, '10': 'approved'},
  ],
};

/// Descriptor for `ApproveSessionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List approveSessionResponseDescriptor = $convert.base64Decode(
    'ChZBcHByb3ZlU2Vzc2lvblJlc3BvbnNlEhoKCGFwcHJvdmVkGAEgASgIUghhcHByb3ZlZA==');

@$core.Deprecated('Use getAboutServerRequestDescriptor instead')
const GetAboutServerRequest$json = {
  '1': 'GetAboutServerRequest',
  '2': [
    {'1': 'session', '3': 3, '4': 1, '5': 9, '10': 'session'},
  ],
};

/// Descriptor for `GetAboutServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAboutServerRequestDescriptor = $convert.base64Decode(
    'ChVHZXRBYm91dFNlcnZlclJlcXVlc3QSGAoHc2Vzc2lvbhgDIAEoCVIHc2Vzc2lvbg==');

@$core.Deprecated('Use getAboutServerResponseDescriptor instead')
const GetAboutServerResponse$json = {
  '1': 'GetAboutServerResponse',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `GetAboutServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAboutServerResponseDescriptor = $convert.base64Decode(
    'ChZHZXRBYm91dFNlcnZlclJlc3BvbnNlEhIKBG5hbWUYASABKAlSBG5hbWU=');

@$core.Deprecated('Use fetchPlanIdsRequestDescriptor instead')
const FetchPlanIdsRequest$json = {
  '1': 'FetchPlanIdsRequest',
  '2': [
    {'1': 'session', '3': 3, '4': 1, '5': 9, '10': 'session'},
  ],
};

/// Descriptor for `FetchPlanIdsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fetchPlanIdsRequestDescriptor = $convert.base64Decode(
    'ChNGZXRjaFBsYW5JZHNSZXF1ZXN0EhgKB3Nlc3Npb24YAyABKAlSB3Nlc3Npb24=');

@$core.Deprecated('Use fetchPlanIdsResponseDescriptor instead')
const FetchPlanIdsResponse$json = {
  '1': 'FetchPlanIdsResponse',
  '2': [
    {'1': 'planIds', '3': 1, '4': 3, '5': 9, '10': 'planIds'},
    {'1': 'answer', '3': 7, '4': 1, '5': 11, '6': '.vw.share.ServerAnswer', '10': 'answer'},
  ],
};

/// Descriptor for `FetchPlanIdsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fetchPlanIdsResponseDescriptor = $convert.base64Decode(
    'ChRGZXRjaFBsYW5JZHNSZXNwb25zZRIYCgdwbGFuSWRzGAEgAygJUgdwbGFuSWRzEi4KBmFuc3'
    'dlchgHIAEoCzIWLnZ3LnNoYXJlLlNlcnZlckFuc3dlclIGYW5zd2Vy');

@$core.Deprecated('Use fetchPlanRequestDescriptor instead')
const FetchPlanRequest$json = {
  '1': 'FetchPlanRequest',
  '2': [
    {'1': 'session', '3': 3, '4': 1, '5': 9, '10': 'session'},
    {'1': 'plan_id', '3': 4, '4': 1, '5': 9, '10': 'planId'},
    {'1': 'answer', '3': 7, '4': 1, '5': 11, '6': '.vw.share.ServerAnswer', '10': 'answer'},
  ],
};

/// Descriptor for `FetchPlanRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fetchPlanRequestDescriptor = $convert.base64Decode(
    'ChBGZXRjaFBsYW5SZXF1ZXN0EhgKB3Nlc3Npb24YAyABKAlSB3Nlc3Npb24SFwoHcGxhbl9pZB'
    'gEIAEoCVIGcGxhbklkEi4KBmFuc3dlchgHIAEoCzIWLnZ3LnNoYXJlLlNlcnZlckFuc3dlclIG'
    'YW5zd2Vy');

@$core.Deprecated('Use fetchPlanResponseDescriptor instead')
const FetchPlanResponse$json = {
  '1': 'FetchPlanResponse',
  '2': [
    {'1': 'plan', '3': 4, '4': 1, '5': 11, '6': '.vw.share.PlanBase', '10': 'plan'},
    {'1': 'answer', '3': 7, '4': 1, '5': 11, '6': '.vw.share.ServerAnswer', '10': 'answer'},
  ],
};

/// Descriptor for `FetchPlanResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fetchPlanResponseDescriptor = $convert.base64Decode(
    'ChFGZXRjaFBsYW5SZXNwb25zZRImCgRwbGFuGAQgASgLMhIudncuc2hhcmUuUGxhbkJhc2VSBH'
    'BsYW4SLgoGYW5zd2VyGAcgASgLMhYudncuc2hhcmUuU2VydmVyQW5zd2VyUgZhbnN3ZXI=');

@$core.Deprecated('Use setCurrentPlanRequestDescriptor instead')
const SetCurrentPlanRequest$json = {
  '1': 'SetCurrentPlanRequest',
  '2': [
    {'1': 'session', '3': 3, '4': 1, '5': 9, '10': 'session'},
    {'1': 'plan_id', '3': 4, '4': 1, '5': 9, '10': 'planId'},
  ],
};

/// Descriptor for `SetCurrentPlanRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setCurrentPlanRequestDescriptor = $convert.base64Decode(
    'ChVTZXRDdXJyZW50UGxhblJlcXVlc3QSGAoHc2Vzc2lvbhgDIAEoCVIHc2Vzc2lvbhIXCgdwbG'
    'FuX2lkGAQgASgJUgZwbGFuSWQ=');

@$core.Deprecated('Use setCurrentPlanResponseDescriptor instead')
const SetCurrentPlanResponse$json = {
  '1': 'SetCurrentPlanResponse',
  '2': [
    {'1': 'answer', '3': 7, '4': 1, '5': 11, '6': '.vw.share.ServerAnswer', '10': 'answer'},
  ],
};

/// Descriptor for `SetCurrentPlanResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setCurrentPlanResponseDescriptor = $convert.base64Decode(
    'ChZTZXRDdXJyZW50UGxhblJlc3BvbnNlEi4KBmFuc3dlchgHIAEoCzIWLnZ3LnNoYXJlLlNlcn'
    'ZlckFuc3dlclIGYW5zd2Vy');

@$core.Deprecated('Use actBaseRequestDescriptor instead')
const ActBaseRequest$json = {
  '1': 'ActBaseRequest',
  '2': [
    {'1': 'session', '3': 3, '4': 1, '5': 9, '10': 'session'},
    {'1': 'act', '3': 6, '4': 1, '5': 11, '6': '.vw.share.ActBase', '10': 'act'},
  ],
};

/// Descriptor for `ActBaseRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List actBaseRequestDescriptor = $convert.base64Decode(
    'Cg5BY3RCYXNlUmVxdWVzdBIYCgdzZXNzaW9uGAMgASgJUgdzZXNzaW9uEiMKA2FjdBgGIAEoCz'
    'IRLnZ3LnNoYXJlLkFjdEJhc2VSA2FjdA==');

@$core.Deprecated('Use actBaseResponseDescriptor instead')
const ActBaseResponse$json = {
  '1': 'ActBaseResponse',
  '2': [
    {'1': 'act', '3': 6, '4': 1, '5': 11, '6': '.vw.share.ActBase', '10': 'act'},
    {'1': 'answer', '3': 7, '4': 1, '5': 11, '6': '.vw.share.ServerAnswer', '10': 'answer'},
  ],
};

/// Descriptor for `ActBaseResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List actBaseResponseDescriptor = $convert.base64Decode(
    'Cg9BY3RCYXNlUmVzcG9uc2USIwoDYWN0GAYgASgLMhEudncuc2hhcmUuQWN0QmFzZVIDYWN0Ei'
    '4KBmFuc3dlchgHIAEoCzIWLnZ3LnNoYXJlLlNlcnZlckFuc3dlclIGYW5zd2Vy');

