//
//  Generated code. Do not modify.
//  source: vw/share/responses/json.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../server_answer.pb.dart' as $1;

class JsonResponse extends $pb.GeneratedMessage {
  factory JsonResponse({
    $core.Map<$core.String, $core.String>? json,
    $1.ServerAnswer? answer,
  }) {
    final $result = create();
    if (json != null) {
      $result.json.addAll(json);
    }
    if (answer != null) {
      $result.answer = answer;
    }
    return $result;
  }
  JsonResponse._() : super();
  factory JsonResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory JsonResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'JsonResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'vw.share.responses'), createEmptyInstance: create)
    ..m<$core.String, $core.String>(1, _omitFieldNames ? '' : 'json', entryClassName: 'JsonResponse.JsonEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('vw.share.responses'))
    ..aOM<$1.ServerAnswer>(100, _omitFieldNames ? '' : 'answer', subBuilder: $1.ServerAnswer.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  JsonResponse clone() => JsonResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  JsonResponse copyWith(void Function(JsonResponse) updates) => super.copyWith((message) => updates(message as JsonResponse)) as JsonResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static JsonResponse create() => JsonResponse._();
  JsonResponse createEmptyInstance() => create();
  static $pb.PbList<JsonResponse> createRepeated() => $pb.PbList<JsonResponse>();
  @$core.pragma('dart2js:noInline')
  static JsonResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<JsonResponse>(create);
  static JsonResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.Map<$core.String, $core.String> get json => $_getMap(0);

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
