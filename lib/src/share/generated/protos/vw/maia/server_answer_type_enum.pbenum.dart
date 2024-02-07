//
//  Generated code. Do not modify.
//  source: vw/maia/server_answer_type_enum.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// Enum describing server answer on the call a service.
class ServerAnswerTypeEnumBase extends $pb.ProtobufEnum {
  static const ServerAnswerTypeEnumBase UNSPECIFIED_SERVER_ANSWER_TYPE = ServerAnswerTypeEnumBase._(0, _omitEnumNames ? '' : 'UNSPECIFIED_SERVER_ANSWER_TYPE');
  static const ServerAnswerTypeEnumBase ACCEPTED_SERVER_ANSWER_TYPE = ServerAnswerTypeEnumBase._(200, _omitEnumNames ? '' : 'ACCEPTED_SERVER_ANSWER_TYPE');
  static const ServerAnswerTypeEnumBase REJECTED_SERVER_ANSWER_TYPE = ServerAnswerTypeEnumBase._(400, _omitEnumNames ? '' : 'REJECTED_SERVER_ANSWER_TYPE');

  static const $core.List<ServerAnswerTypeEnumBase> values = <ServerAnswerTypeEnumBase> [
    UNSPECIFIED_SERVER_ANSWER_TYPE,
    ACCEPTED_SERVER_ANSWER_TYPE,
    REJECTED_SERVER_ANSWER_TYPE,
  ];

  static final $core.Map<$core.int, ServerAnswerTypeEnumBase> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ServerAnswerTypeEnumBase? valueOf($core.int value) => _byValue[value];

  const ServerAnswerTypeEnumBase._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
