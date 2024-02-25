//
//  Generated code. Do not modify.
//  source: vw/share/error_explain_enum.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// Enum explaining an [Error].
class ErrorExplainEnumBase extends $pb.ProtobufEnum {
  static const ErrorExplainEnumBase UNSPECIFIED_ERROR_EXPLAIN = ErrorExplainEnumBase._(0, _omitEnumNames ? '' : 'UNSPECIFIED_ERROR_EXPLAIN');
  static const ErrorExplainEnumBase ILLEGAL_ARGUMENT_ERROR_EXPLAIN = ErrorExplainEnumBase._(10, _omitEnumNames ? '' : 'ILLEGAL_ARGUMENT_ERROR_EXPLAIN');
  static const ErrorExplainEnumBase UNIMPLEMENTED_COMPONENT_ERROR_EXPLAIN = ErrorExplainEnumBase._(20, _omitEnumNames ? '' : 'UNIMPLEMENTED_COMPONENT_ERROR_EXPLAIN');
  static const ErrorExplainEnumBase ABSENT_SESSION_LORE_ERROR_EXPLAIN = ErrorExplainEnumBase._(50, _omitEnumNames ? '' : 'ABSENT_SESSION_LORE_ERROR_EXPLAIN');
  static const ErrorExplainEnumBase ABSENT_PLAN_ERROR_EXPLAIN = ErrorExplainEnumBase._(100, _omitEnumNames ? '' : 'ABSENT_PLAN_ERROR_EXPLAIN');
  static const ErrorExplainEnumBase EXISTS_PLAN_ERROR_EXPLAIN = ErrorExplainEnumBase._(101, _omitEnumNames ? '' : 'EXISTS_PLAN_ERROR_EXPLAIN');
  static const ErrorExplainEnumBase ILLEGAL_SESSION_UID_ERROR_EXPLAIN = ErrorExplainEnumBase._(1000, _omitEnumNames ? '' : 'ILLEGAL_SESSION_UID_ERROR_EXPLAIN');
  static const ErrorExplainEnumBase NOT_APPROVED_SESSION_ERROR_EXPLAIN = ErrorExplainEnumBase._(1010, _omitEnumNames ? '' : 'NOT_APPROVED_SESSION_ERROR_EXPLAIN');
  static const ErrorExplainEnumBase NOT_CLAIMED_SESSION_ERROR_EXPLAIN = ErrorExplainEnumBase._(1020, _omitEnumNames ? '' : 'NOT_CLAIMED_SESSION_ERROR_EXPLAIN');
  static const ErrorExplainEnumBase NOT_DEFINED_DEVICE_ERROR_EXPLAIN = ErrorExplainEnumBase._(6000, _omitEnumNames ? '' : 'NOT_DEFINED_DEVICE_ERROR_EXPLAIN');

  static const $core.List<ErrorExplainEnumBase> values = <ErrorExplainEnumBase> [
    UNSPECIFIED_ERROR_EXPLAIN,
    ILLEGAL_ARGUMENT_ERROR_EXPLAIN,
    UNIMPLEMENTED_COMPONENT_ERROR_EXPLAIN,
    ABSENT_SESSION_LORE_ERROR_EXPLAIN,
    ABSENT_PLAN_ERROR_EXPLAIN,
    EXISTS_PLAN_ERROR_EXPLAIN,
    ILLEGAL_SESSION_UID_ERROR_EXPLAIN,
    NOT_APPROVED_SESSION_ERROR_EXPLAIN,
    NOT_CLAIMED_SESSION_ERROR_EXPLAIN,
    NOT_DEFINED_DEVICE_ERROR_EXPLAIN,
  ];

  static final $core.Map<$core.int, ErrorExplainEnumBase> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ErrorExplainEnumBase? valueOf($core.int value) => _byValue[value];

  const ErrorExplainEnumBase._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
