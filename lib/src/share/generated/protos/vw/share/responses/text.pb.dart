//
//  Generated code. Do not modify.
//  source: vw/share/responses/text.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../server_answer.pb.dart' as $1;

class TextResponse extends $pb.GeneratedMessage {
  factory TextResponse({
    $core.String? text,
    $1.ServerAnswer? answer,
  }) {
    final $result = create();
    if (text != null) {
      $result.text = text;
    }
    if (answer != null) {
      $result.answer = answer;
    }
    return $result;
  }
  TextResponse._() : super();
  factory TextResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TextResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TextResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'vw.share.responses'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'text')
    ..aOM<$1.ServerAnswer>(100, _omitFieldNames ? '' : 'answer', subBuilder: $1.ServerAnswer.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TextResponse clone() => TextResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TextResponse copyWith(void Function(TextResponse) updates) => super.copyWith((message) => updates(message as TextResponse)) as TextResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TextResponse create() => TextResponse._();
  TextResponse createEmptyInstance() => create();
  static $pb.PbList<TextResponse> createRepeated() => $pb.PbList<TextResponse>();
  @$core.pragma('dart2js:noInline')
  static TextResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TextResponse>(create);
  static TextResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get text => $_getSZ(0);
  @$pb.TagNumber(1)
  set text($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasText() => $_has(0);
  @$pb.TagNumber(1)
  void clearText() => clearField(1);

  @$pb.TagNumber(100)
  $1.ServerAnswer get answer => $_getN(1);
  @$pb.TagNumber(100)
  set answer($1.ServerAnswer v) { setField(100, v); }
  @$pb.TagNumber(100)
  $core.bool hasAnswer() => $_has(1);
  @$pb.TagNumber(100)
  void clearAnswer() => clearField(100);
  @$pb.TagNumber(100)
  $1.ServerAnswer ensureAnswer() => $_ensure(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
