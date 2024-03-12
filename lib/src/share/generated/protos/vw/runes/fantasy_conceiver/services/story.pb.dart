//
//  Generated code. Do not modify.
//  source: vw/runes/fantasy_conceiver/services/story.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../share/server_answer.pb.dart' as $6;
import '../name_and_id_story.pb.dart' as $9;

class ConceiveNameAndIdStoryResponse extends $pb.GeneratedMessage {
  factory ConceiveNameAndIdStoryResponse({
    $9.NameAndIdStoryBase? data,
    $6.ServerAnswer? answer,
  }) {
    final $result = create();
    if (data != null) {
      $result.data = data;
    }
    if (answer != null) {
      $result.answer = answer;
    }
    return $result;
  }
  ConceiveNameAndIdStoryResponse._() : super();
  factory ConceiveNameAndIdStoryResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConceiveNameAndIdStoryResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ConceiveNameAndIdStoryResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'vw.runes.fantasy_conceiver'), createEmptyInstance: create)
    ..aOM<$9.NameAndIdStoryBase>(1, _omitFieldNames ? '' : 'data', subBuilder: $9.NameAndIdStoryBase.create)
    ..aOM<$6.ServerAnswer>(100, _omitFieldNames ? '' : 'answer', subBuilder: $6.ServerAnswer.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ConceiveNameAndIdStoryResponse clone() => ConceiveNameAndIdStoryResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ConceiveNameAndIdStoryResponse copyWith(void Function(ConceiveNameAndIdStoryResponse) updates) => super.copyWith((message) => updates(message as ConceiveNameAndIdStoryResponse)) as ConceiveNameAndIdStoryResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConceiveNameAndIdStoryResponse create() => ConceiveNameAndIdStoryResponse._();
  ConceiveNameAndIdStoryResponse createEmptyInstance() => create();
  static $pb.PbList<ConceiveNameAndIdStoryResponse> createRepeated() => $pb.PbList<ConceiveNameAndIdStoryResponse>();
  @$core.pragma('dart2js:noInline')
  static ConceiveNameAndIdStoryResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ConceiveNameAndIdStoryResponse>(create);
  static ConceiveNameAndIdStoryResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $9.NameAndIdStoryBase get data => $_getN(0);
  @$pb.TagNumber(1)
  set data($9.NameAndIdStoryBase v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasData() => $_has(0);
  @$pb.TagNumber(1)
  void clearData() => clearField(1);
  @$pb.TagNumber(1)
  $9.NameAndIdStoryBase ensureData() => $_ensure(0);

  @$pb.TagNumber(100)
  $6.ServerAnswer get answer => $_getN(1);
  @$pb.TagNumber(100)
  set answer($6.ServerAnswer v) { setField(100, v); }
  @$pb.TagNumber(100)
  $core.bool hasAnswer() => $_has(1);
  @$pb.TagNumber(100)
  void clearAnswer() => clearField(100);
  @$pb.TagNumber(100)
  $6.ServerAnswer ensureAnswer() => $_ensure(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
