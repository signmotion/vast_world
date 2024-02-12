//
//  Generated code. Do not modify.
//  source: vw/share/requests/prompt.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

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

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PromptRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'vw.share.requests'), createEmptyInstance: create)
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


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
