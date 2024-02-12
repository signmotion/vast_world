//
//  Generated code. Do not modify.
//  source: vw/share/server_answer.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use serverAnswerDescriptor instead')
const ServerAnswer$json = {
  '1': 'ServerAnswer',
  '2': [
    {'1': 'session', '3': 3, '4': 1, '5': 9, '10': 'session'},
    {'1': 'type', '3': 10, '4': 1, '5': 14, '6': '.vw.share.ServerAnswerTypeEnumBase', '10': 'type'},
    {'1': 'code_explain', '3': 11, '4': 1, '5': 14, '6': '.vw.share.ErrorExplainEnumBase', '10': 'codeExplain'},
    {'1': 'message_explain', '3': 12, '4': 1, '5': 9, '10': 'messageExplain'},
  ],
};

/// Descriptor for `ServerAnswer`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List serverAnswerDescriptor = $convert.base64Decode(
    'CgxTZXJ2ZXJBbnN3ZXISGAoHc2Vzc2lvbhgDIAEoCVIHc2Vzc2lvbhI2CgR0eXBlGAogASgOMi'
    'Iudncuc2hhcmUuU2VydmVyQW5zd2VyVHlwZUVudW1CYXNlUgR0eXBlEkEKDGNvZGVfZXhwbGFp'
    'bhgLIAEoDjIeLnZ3LnNoYXJlLkVycm9yRXhwbGFpbkVudW1CYXNlUgtjb2RlRXhwbGFpbhInCg'
    '9tZXNzYWdlX2V4cGxhaW4YDCABKAlSDm1lc3NhZ2VFeHBsYWlu');

