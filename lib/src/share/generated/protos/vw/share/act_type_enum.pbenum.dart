//
//  Generated code. Do not modify.
//  source: vw/share/act_type_enum.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// Enum describing types of [Act]s.
class ActTypeEnumBase extends $pb.ProtobufEnum {
  static const ActTypeEnumBase UNSPECIFIED_ACT_TYPE = ActTypeEnumBase._(0, _omitEnumNames ? '' : 'UNSPECIFIED_ACT_TYPE');
  static const ActTypeEnumBase CHANGE_VALUE_ACT_TYPE = ActTypeEnumBase._(12, _omitEnumNames ? '' : 'CHANGE_VALUE_ACT_TYPE');
  static const ActTypeEnumBase CHANGE_VALUE_TO_DEFAULTS_ACT_TYPE = ActTypeEnumBase._(13, _omitEnumNames ? '' : 'CHANGE_VALUE_TO_DEFAULTS_ACT_TYPE');
  static const ActTypeEnumBase CHANGE_VALUE_TO_EMPTY_ACT_TYPE = ActTypeEnumBase._(14, _omitEnumNames ? '' : 'CHANGE_VALUE_TO_EMPTY_ACT_TYPE');
  static const ActTypeEnumBase REMOVE_VALUE_ACT_TYPE = ActTypeEnumBase._(20, _omitEnumNames ? '' : 'REMOVE_VALUE_ACT_TYPE');

  static const $core.List<ActTypeEnumBase> values = <ActTypeEnumBase> [
    UNSPECIFIED_ACT_TYPE,
    CHANGE_VALUE_ACT_TYPE,
    CHANGE_VALUE_TO_DEFAULTS_ACT_TYPE,
    CHANGE_VALUE_TO_EMPTY_ACT_TYPE,
    REMOVE_VALUE_ACT_TYPE,
  ];

  static final $core.Map<$core.int, ActTypeEnumBase> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ActTypeEnumBase? valueOf($core.int value) => _byValue[value];

  const ActTypeEnumBase._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
