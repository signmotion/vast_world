//
//  Generated code. Do not modify.
//  source: vw/share/server_answer.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'error_explain_enum.pbenum.dart' as $4;
import 'server_answer_type_enum.pbenum.dart' as $3;

class ServerAnswer extends $pb.GeneratedMessage {
  factory ServerAnswer({
    $core.String? session,
    $3.ServerAnswerTypeEnumBase? type,
    $4.ErrorExplainEnumBase? codeExplain,
    $core.String? messageExplain,
  }) {
    final $result = create();
    if (session != null) {
      $result.session = session;
    }
    if (type != null) {
      $result.type = type;
    }
    if (codeExplain != null) {
      $result.codeExplain = codeExplain;
    }
    if (messageExplain != null) {
      $result.messageExplain = messageExplain;
    }
    return $result;
  }
  ServerAnswer._() : super();
  factory ServerAnswer.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ServerAnswer.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ServerAnswer', package: const $pb.PackageName(_omitMessageNames ? '' : 'vw.share'), createEmptyInstance: create)
    ..aOS(3, _omitFieldNames ? '' : 'session')
    ..e<$3.ServerAnswerTypeEnumBase>(10, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: $3.ServerAnswerTypeEnumBase.UNSPECIFIED_SERVER_ANSWER_TYPE, valueOf: $3.ServerAnswerTypeEnumBase.valueOf, enumValues: $3.ServerAnswerTypeEnumBase.values)
    ..e<$4.ErrorExplainEnumBase>(11, _omitFieldNames ? '' : 'codeExplain', $pb.PbFieldType.OE, defaultOrMaker: $4.ErrorExplainEnumBase.UNSPECIFIED_ERROR_EXPLAIN, valueOf: $4.ErrorExplainEnumBase.valueOf, enumValues: $4.ErrorExplainEnumBase.values)
    ..aOS(12, _omitFieldNames ? '' : 'messageExplain')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ServerAnswer clone() => ServerAnswer()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ServerAnswer copyWith(void Function(ServerAnswer) updates) => super.copyWith((message) => updates(message as ServerAnswer)) as ServerAnswer;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ServerAnswer create() => ServerAnswer._();
  ServerAnswer createEmptyInstance() => create();
  static $pb.PbList<ServerAnswer> createRepeated() => $pb.PbList<ServerAnswer>();
  @$core.pragma('dart2js:noInline')
  static ServerAnswer getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ServerAnswer>(create);
  static ServerAnswer? _defaultInstance;

  @$pb.TagNumber(3)
  $core.String get session => $_getSZ(0);
  @$pb.TagNumber(3)
  set session($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(3)
  $core.bool hasSession() => $_has(0);
  @$pb.TagNumber(3)
  void clearSession() => clearField(3);

  @$pb.TagNumber(10)
  $3.ServerAnswerTypeEnumBase get type => $_getN(1);
  @$pb.TagNumber(10)
  set type($3.ServerAnswerTypeEnumBase v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(10)
  void clearType() => clearField(10);

  @$pb.TagNumber(11)
  $4.ErrorExplainEnumBase get codeExplain => $_getN(2);
  @$pb.TagNumber(11)
  set codeExplain($4.ErrorExplainEnumBase v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasCodeExplain() => $_has(2);
  @$pb.TagNumber(11)
  void clearCodeExplain() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get messageExplain => $_getSZ(3);
  @$pb.TagNumber(12)
  set messageExplain($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(12)
  $core.bool hasMessageExplain() => $_has(3);
  @$pb.TagNumber(12)
  void clearMessageExplain() => clearField(12);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
