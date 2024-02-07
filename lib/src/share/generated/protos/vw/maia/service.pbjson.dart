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
    {'1': 'uid_device', '3': 4, '4': 1, '5': 9, '10': 'uidDevice'},
  ],
};

/// Descriptor for `ClaimSessionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List claimSessionRequestDescriptor = $convert.base64Decode(
    'ChNDbGFpbVNlc3Npb25SZXF1ZXN0Eh0KCnVpZF9kZXZpY2UYBCABKAlSCXVpZERldmljZQ==');

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
    {'1': 'answer', '3': 7, '4': 1, '5': 14, '6': '.vw.maia.ServerAnswerTypeEnumBase', '10': 'answer'},
    {'1': 'code_explain', '3': 8, '4': 1, '5': 14, '6': '.vw.share.ErrorExplainEnumBase', '10': 'codeExplain'},
    {'1': 'message_explain', '3': 9, '4': 1, '5': 9, '10': 'messageExplain'},
  ],
};

/// Descriptor for `SetCurrentPlanResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setCurrentPlanResponseDescriptor = $convert.base64Decode(
    'ChZTZXRDdXJyZW50UGxhblJlc3BvbnNlEjkKBmFuc3dlchgHIAEoDjIhLnZ3Lm1haWEuU2Vydm'
    'VyQW5zd2VyVHlwZUVudW1CYXNlUgZhbnN3ZXISQQoMY29kZV9leHBsYWluGAggASgOMh4udncu'
    'c2hhcmUuRXJyb3JFeHBsYWluRW51bUJhc2VSC2NvZGVFeHBsYWluEicKD21lc3NhZ2VfZXhwbG'
    'FpbhgJIAEoCVIObWVzc2FnZUV4cGxhaW4=');

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
    {'1': 'session', '3': 3, '4': 1, '5': 9, '10': 'session'},
    {'1': 'act', '3': 6, '4': 1, '5': 11, '6': '.vw.share.ActBase', '10': 'act'},
    {'1': 'answer', '3': 7, '4': 1, '5': 14, '6': '.vw.maia.ServerAnswerTypeEnumBase', '10': 'answer'},
  ],
};

/// Descriptor for `ActBaseResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List actBaseResponseDescriptor = $convert.base64Decode(
    'Cg9BY3RCYXNlUmVzcG9uc2USGAoHc2Vzc2lvbhgDIAEoCVIHc2Vzc2lvbhIjCgNhY3QYBiABKA'
    'syES52dy5zaGFyZS5BY3RCYXNlUgNhY3QSOQoGYW5zd2VyGAcgASgOMiEudncubWFpYS5TZXJ2'
    'ZXJBbnN3ZXJUeXBlRW51bUJhc2VSBmFuc3dlcg==');

