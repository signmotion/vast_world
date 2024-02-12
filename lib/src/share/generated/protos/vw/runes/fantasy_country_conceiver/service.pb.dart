//
//  Generated code. Do not modify.
//  source: vw/runes/fantasy_country_conceiver/service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../syrokomskyi/type/image.pb.dart' as $1;
import '../../maia/server_answer_type_enum.pbenum.dart' as $2;
import '../../share/error_explain_enum.pbenum.dart' as $3;

/// TODO Move to share.
class PromptRequest extends $pb.GeneratedMessage {
  factory PromptRequest({
    $core.String? prompt,
    $core.String? session,
  }) {
    final $result = create();
    if (prompt != null) {
      $result.prompt = prompt;
    }
    if (session != null) {
      $result.session = session;
    }
    return $result;
  }
  PromptRequest._() : super();
  factory PromptRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PromptRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PromptRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'vw.runes.fantasy_country_conceiver'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'prompt')
    ..aOS(3, _omitFieldNames ? '' : 'session')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PromptRequest clone() => PromptRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PromptRequest copyWith(void Function(PromptRequest) updates) => super.copyWith((message) => updates(message as PromptRequest)) as PromptRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PromptRequest create() => PromptRequest._();
  PromptRequest createEmptyInstance() => create();
  static $pb.PbList<PromptRequest> createRepeated() => $pb.PbList<PromptRequest>();
  @$core.pragma('dart2js:noInline')
  static PromptRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PromptRequest>(create);
  static PromptRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get prompt => $_getSZ(0);
  @$pb.TagNumber(1)
  set prompt($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPrompt() => $_has(0);
  @$pb.TagNumber(1)
  void clearPrompt() => clearField(1);

  @$pb.TagNumber(3)
  $core.String get session => $_getSZ(1);
  @$pb.TagNumber(3)
  set session($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasSession() => $_has(1);
  @$pb.TagNumber(3)
  void clearSession() => clearField(3);
}

/// TODO Move to share.
class ImageResponse extends $pb.GeneratedMessage {
  factory ImageResponse({
    $1.Image? image,
    ServerAnswer? answer,
  }) {
    final $result = create();
    if (image != null) {
      $result.image = image;
    }
    if (answer != null) {
      $result.answer = answer;
    }
    return $result;
  }
  ImageResponse._() : super();
  factory ImageResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ImageResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ImageResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'vw.runes.fantasy_country_conceiver'), createEmptyInstance: create)
    ..aOM<$1.Image>(1, _omitFieldNames ? '' : 'image', subBuilder: $1.Image.create)
    ..aOM<ServerAnswer>(100, _omitFieldNames ? '' : 'answer', subBuilder: ServerAnswer.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ImageResponse clone() => ImageResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ImageResponse copyWith(void Function(ImageResponse) updates) => super.copyWith((message) => updates(message as ImageResponse)) as ImageResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ImageResponse create() => ImageResponse._();
  ImageResponse createEmptyInstance() => create();
  static $pb.PbList<ImageResponse> createRepeated() => $pb.PbList<ImageResponse>();
  @$core.pragma('dart2js:noInline')
  static ImageResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ImageResponse>(create);
  static ImageResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $1.Image get image => $_getN(0);
  @$pb.TagNumber(1)
  set image($1.Image v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasImage() => $_has(0);
  @$pb.TagNumber(1)
  void clearImage() => clearField(1);
  @$pb.TagNumber(1)
  $1.Image ensureImage() => $_ensure(0);

  @$pb.TagNumber(100)
  ServerAnswer get answer => $_getN(1);
  @$pb.TagNumber(100)
  set answer(ServerAnswer v) { setField(100, v); }
  @$pb.TagNumber(100)
  $core.bool hasAnswer() => $_has(1);
  @$pb.TagNumber(100)
  void clearAnswer() => clearField(100);
  @$pb.TagNumber(100)
  ServerAnswer ensureAnswer() => $_ensure(1);
}

/// TODO Move to share.
class JsonResponse extends $pb.GeneratedMessage {
  factory JsonResponse({
    $core.Map<$core.String, $core.String>? json,
    ServerAnswer? answer,
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

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'JsonResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'vw.runes.fantasy_country_conceiver'), createEmptyInstance: create)
    ..m<$core.String, $core.String>(1, _omitFieldNames ? '' : 'json', entryClassName: 'JsonResponse.JsonEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('vw.runes.fantasy_country_conceiver'))
    ..aOM<ServerAnswer>(100, _omitFieldNames ? '' : 'answer', subBuilder: ServerAnswer.create)
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
  ServerAnswer get answer => $_getN(1);
  @$pb.TagNumber(100)
  set answer(ServerAnswer v) { setField(100, v); }
  @$pb.TagNumber(100)
  $core.bool hasAnswer() => $_has(1);
  @$pb.TagNumber(100)
  void clearAnswer() => clearField(100);
  @$pb.TagNumber(100)
  ServerAnswer ensureAnswer() => $_ensure(1);
}

/// TODO Move to share.
class TextResponse extends $pb.GeneratedMessage {
  factory TextResponse({
    $core.String? text,
    ServerAnswer? answer,
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

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TextResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'vw.runes.fantasy_country_conceiver'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'text')
    ..aOM<ServerAnswer>(100, _omitFieldNames ? '' : 'answer', subBuilder: ServerAnswer.create)
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
  ServerAnswer get answer => $_getN(1);
  @$pb.TagNumber(100)
  set answer(ServerAnswer v) { setField(100, v); }
  @$pb.TagNumber(100)
  $core.bool hasAnswer() => $_has(1);
  @$pb.TagNumber(100)
  void clearAnswer() => clearField(100);
  @$pb.TagNumber(100)
  ServerAnswer ensureAnswer() => $_ensure(1);
}

/// TODO Move to share.
class ServerAnswer extends $pb.GeneratedMessage {
  factory ServerAnswer({
    $core.String? session,
    $2.ServerAnswerTypeEnumBase? type,
    $3.ErrorExplainEnumBase? codeExplain,
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

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ServerAnswer', package: const $pb.PackageName(_omitMessageNames ? '' : 'vw.runes.fantasy_country_conceiver'), createEmptyInstance: create)
    ..aOS(3, _omitFieldNames ? '' : 'session')
    ..e<$2.ServerAnswerTypeEnumBase>(10, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: $2.ServerAnswerTypeEnumBase.UNSPECIFIED_SERVER_ANSWER_TYPE, valueOf: $2.ServerAnswerTypeEnumBase.valueOf, enumValues: $2.ServerAnswerTypeEnumBase.values)
    ..e<$3.ErrorExplainEnumBase>(11, _omitFieldNames ? '' : 'codeExplain', $pb.PbFieldType.OE, defaultOrMaker: $3.ErrorExplainEnumBase.UNSPECIFIED_ERROR_EXPLAIN, valueOf: $3.ErrorExplainEnumBase.valueOf, enumValues: $3.ErrorExplainEnumBase.values)
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
  $2.ServerAnswerTypeEnumBase get type => $_getN(1);
  @$pb.TagNumber(10)
  set type($2.ServerAnswerTypeEnumBase v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(10)
  void clearType() => clearField(10);

  @$pb.TagNumber(11)
  $3.ErrorExplainEnumBase get codeExplain => $_getN(2);
  @$pb.TagNumber(11)
  set codeExplain($3.ErrorExplainEnumBase v) { setField(11, v); }
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
