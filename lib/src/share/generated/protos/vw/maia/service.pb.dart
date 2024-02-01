//
//  Generated code. Do not modify.
//  source: vw/maia/service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../share/act.pb.dart' as $2;
import 'server_answer_type_enum.pbenum.dart' as $3;

class ClaimSessionRequest extends $pb.GeneratedMessage {
  factory ClaimSessionRequest({
    $core.String? uidDevice,
  }) {
    final $result = create();
    if (uidDevice != null) {
      $result.uidDevice = uidDevice;
    }
    return $result;
  }
  ClaimSessionRequest._() : super();
  factory ClaimSessionRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ClaimSessionRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ClaimSessionRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'vw.maia'), createEmptyInstance: create)
    ..aOS(4, _omitFieldNames ? '' : 'uidDevice')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ClaimSessionRequest clone() => ClaimSessionRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ClaimSessionRequest copyWith(void Function(ClaimSessionRequest) updates) => super.copyWith((message) => updates(message as ClaimSessionRequest)) as ClaimSessionRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ClaimSessionRequest create() => ClaimSessionRequest._();
  ClaimSessionRequest createEmptyInstance() => create();
  static $pb.PbList<ClaimSessionRequest> createRepeated() => $pb.PbList<ClaimSessionRequest>();
  @$core.pragma('dart2js:noInline')
  static ClaimSessionRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ClaimSessionRequest>(create);
  static ClaimSessionRequest? _defaultInstance;

  @$pb.TagNumber(4)
  $core.String get uidDevice => $_getSZ(0);
  @$pb.TagNumber(4)
  set uidDevice($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(4)
  $core.bool hasUidDevice() => $_has(0);
  @$pb.TagNumber(4)
  void clearUidDevice() => clearField(4);
}

class ClaimSessionResponse extends $pb.GeneratedMessage {
  factory ClaimSessionResponse({
    $core.String? issuedSession,
  }) {
    final $result = create();
    if (issuedSession != null) {
      $result.issuedSession = issuedSession;
    }
    return $result;
  }
  ClaimSessionResponse._() : super();
  factory ClaimSessionResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ClaimSessionResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ClaimSessionResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'vw.maia'), createEmptyInstance: create)
    ..aOS(3, _omitFieldNames ? '' : 'issuedSession')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ClaimSessionResponse clone() => ClaimSessionResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ClaimSessionResponse copyWith(void Function(ClaimSessionResponse) updates) => super.copyWith((message) => updates(message as ClaimSessionResponse)) as ClaimSessionResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ClaimSessionResponse create() => ClaimSessionResponse._();
  ClaimSessionResponse createEmptyInstance() => create();
  static $pb.PbList<ClaimSessionResponse> createRepeated() => $pb.PbList<ClaimSessionResponse>();
  @$core.pragma('dart2js:noInline')
  static ClaimSessionResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ClaimSessionResponse>(create);
  static ClaimSessionResponse? _defaultInstance;

  @$pb.TagNumber(3)
  $core.String get issuedSession => $_getSZ(0);
  @$pb.TagNumber(3)
  set issuedSession($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(3)
  $core.bool hasIssuedSession() => $_has(0);
  @$pb.TagNumber(3)
  void clearIssuedSession() => clearField(3);
}

class ApproveSessionRequest extends $pb.GeneratedMessage {
  factory ApproveSessionRequest({
    $core.String? session,
    $core.String? uidDevice,
  }) {
    final $result = create();
    if (session != null) {
      $result.session = session;
    }
    if (uidDevice != null) {
      $result.uidDevice = uidDevice;
    }
    return $result;
  }
  ApproveSessionRequest._() : super();
  factory ApproveSessionRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ApproveSessionRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ApproveSessionRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'vw.maia'), createEmptyInstance: create)
    ..aOS(3, _omitFieldNames ? '' : 'session')
    ..aOS(4, _omitFieldNames ? '' : 'uidDevice')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ApproveSessionRequest clone() => ApproveSessionRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ApproveSessionRequest copyWith(void Function(ApproveSessionRequest) updates) => super.copyWith((message) => updates(message as ApproveSessionRequest)) as ApproveSessionRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ApproveSessionRequest create() => ApproveSessionRequest._();
  ApproveSessionRequest createEmptyInstance() => create();
  static $pb.PbList<ApproveSessionRequest> createRepeated() => $pb.PbList<ApproveSessionRequest>();
  @$core.pragma('dart2js:noInline')
  static ApproveSessionRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ApproveSessionRequest>(create);
  static ApproveSessionRequest? _defaultInstance;

  @$pb.TagNumber(3)
  $core.String get session => $_getSZ(0);
  @$pb.TagNumber(3)
  set session($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(3)
  $core.bool hasSession() => $_has(0);
  @$pb.TagNumber(3)
  void clearSession() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get uidDevice => $_getSZ(1);
  @$pb.TagNumber(4)
  set uidDevice($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(4)
  $core.bool hasUidDevice() => $_has(1);
  @$pb.TagNumber(4)
  void clearUidDevice() => clearField(4);
}

class ApproveSessionResponse extends $pb.GeneratedMessage {
  factory ApproveSessionResponse({
    $core.bool? approved,
  }) {
    final $result = create();
    if (approved != null) {
      $result.approved = approved;
    }
    return $result;
  }
  ApproveSessionResponse._() : super();
  factory ApproveSessionResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ApproveSessionResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ApproveSessionResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'vw.maia'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'approved')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ApproveSessionResponse clone() => ApproveSessionResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ApproveSessionResponse copyWith(void Function(ApproveSessionResponse) updates) => super.copyWith((message) => updates(message as ApproveSessionResponse)) as ApproveSessionResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ApproveSessionResponse create() => ApproveSessionResponse._();
  ApproveSessionResponse createEmptyInstance() => create();
  static $pb.PbList<ApproveSessionResponse> createRepeated() => $pb.PbList<ApproveSessionResponse>();
  @$core.pragma('dart2js:noInline')
  static ApproveSessionResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ApproveSessionResponse>(create);
  static ApproveSessionResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get approved => $_getBF(0);
  @$pb.TagNumber(1)
  set approved($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasApproved() => $_has(0);
  @$pb.TagNumber(1)
  void clearApproved() => clearField(1);
}

class GetAboutServerRequest extends $pb.GeneratedMessage {
  factory GetAboutServerRequest({
    $core.String? session,
  }) {
    final $result = create();
    if (session != null) {
      $result.session = session;
    }
    return $result;
  }
  GetAboutServerRequest._() : super();
  factory GetAboutServerRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetAboutServerRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetAboutServerRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'vw.maia'), createEmptyInstance: create)
    ..aOS(3, _omitFieldNames ? '' : 'session')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetAboutServerRequest clone() => GetAboutServerRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetAboutServerRequest copyWith(void Function(GetAboutServerRequest) updates) => super.copyWith((message) => updates(message as GetAboutServerRequest)) as GetAboutServerRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetAboutServerRequest create() => GetAboutServerRequest._();
  GetAboutServerRequest createEmptyInstance() => create();
  static $pb.PbList<GetAboutServerRequest> createRepeated() => $pb.PbList<GetAboutServerRequest>();
  @$core.pragma('dart2js:noInline')
  static GetAboutServerRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetAboutServerRequest>(create);
  static GetAboutServerRequest? _defaultInstance;

  @$pb.TagNumber(3)
  $core.String get session => $_getSZ(0);
  @$pb.TagNumber(3)
  set session($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(3)
  $core.bool hasSession() => $_has(0);
  @$pb.TagNumber(3)
  void clearSession() => clearField(3);
}

class GetAboutServerResponse extends $pb.GeneratedMessage {
  factory GetAboutServerResponse({
    $core.String? name,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    return $result;
  }
  GetAboutServerResponse._() : super();
  factory GetAboutServerResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetAboutServerResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetAboutServerResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'vw.maia'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetAboutServerResponse clone() => GetAboutServerResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetAboutServerResponse copyWith(void Function(GetAboutServerResponse) updates) => super.copyWith((message) => updates(message as GetAboutServerResponse)) as GetAboutServerResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetAboutServerResponse create() => GetAboutServerResponse._();
  GetAboutServerResponse createEmptyInstance() => create();
  static $pb.PbList<GetAboutServerResponse> createRepeated() => $pb.PbList<GetAboutServerResponse>();
  @$core.pragma('dart2js:noInline')
  static GetAboutServerResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetAboutServerResponse>(create);
  static GetAboutServerResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);
}

class ActBaseRequest extends $pb.GeneratedMessage {
  factory ActBaseRequest({
    $core.String? session,
    $2.ActBase? act,
  }) {
    final $result = create();
    if (session != null) {
      $result.session = session;
    }
    if (act != null) {
      $result.act = act;
    }
    return $result;
  }
  ActBaseRequest._() : super();
  factory ActBaseRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ActBaseRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ActBaseRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'vw.maia'), createEmptyInstance: create)
    ..aOS(3, _omitFieldNames ? '' : 'session')
    ..aOM<$2.ActBase>(6, _omitFieldNames ? '' : 'act', subBuilder: $2.ActBase.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ActBaseRequest clone() => ActBaseRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ActBaseRequest copyWith(void Function(ActBaseRequest) updates) => super.copyWith((message) => updates(message as ActBaseRequest)) as ActBaseRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ActBaseRequest create() => ActBaseRequest._();
  ActBaseRequest createEmptyInstance() => create();
  static $pb.PbList<ActBaseRequest> createRepeated() => $pb.PbList<ActBaseRequest>();
  @$core.pragma('dart2js:noInline')
  static ActBaseRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ActBaseRequest>(create);
  static ActBaseRequest? _defaultInstance;

  @$pb.TagNumber(3)
  $core.String get session => $_getSZ(0);
  @$pb.TagNumber(3)
  set session($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(3)
  $core.bool hasSession() => $_has(0);
  @$pb.TagNumber(3)
  void clearSession() => clearField(3);

  @$pb.TagNumber(6)
  $2.ActBase get act => $_getN(1);
  @$pb.TagNumber(6)
  set act($2.ActBase v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasAct() => $_has(1);
  @$pb.TagNumber(6)
  void clearAct() => clearField(6);
  @$pb.TagNumber(6)
  $2.ActBase ensureAct() => $_ensure(1);
}

class ActBaseResponse extends $pb.GeneratedMessage {
  factory ActBaseResponse({
    $core.String? session,
    $2.ActBase? act,
    $3.ServerAnswerTypeEnumBase? answer,
  }) {
    final $result = create();
    if (session != null) {
      $result.session = session;
    }
    if (act != null) {
      $result.act = act;
    }
    if (answer != null) {
      $result.answer = answer;
    }
    return $result;
  }
  ActBaseResponse._() : super();
  factory ActBaseResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ActBaseResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ActBaseResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'vw.maia'), createEmptyInstance: create)
    ..aOS(3, _omitFieldNames ? '' : 'session')
    ..aOM<$2.ActBase>(6, _omitFieldNames ? '' : 'act', subBuilder: $2.ActBase.create)
    ..e<$3.ServerAnswerTypeEnumBase>(7, _omitFieldNames ? '' : 'answer', $pb.PbFieldType.OE, defaultOrMaker: $3.ServerAnswerTypeEnumBase.UNSPECIFIED_SERVER_ANSWER_TYPE, valueOf: $3.ServerAnswerTypeEnumBase.valueOf, enumValues: $3.ServerAnswerTypeEnumBase.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ActBaseResponse clone() => ActBaseResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ActBaseResponse copyWith(void Function(ActBaseResponse) updates) => super.copyWith((message) => updates(message as ActBaseResponse)) as ActBaseResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ActBaseResponse create() => ActBaseResponse._();
  ActBaseResponse createEmptyInstance() => create();
  static $pb.PbList<ActBaseResponse> createRepeated() => $pb.PbList<ActBaseResponse>();
  @$core.pragma('dart2js:noInline')
  static ActBaseResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ActBaseResponse>(create);
  static ActBaseResponse? _defaultInstance;

  @$pb.TagNumber(3)
  $core.String get session => $_getSZ(0);
  @$pb.TagNumber(3)
  set session($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(3)
  $core.bool hasSession() => $_has(0);
  @$pb.TagNumber(3)
  void clearSession() => clearField(3);

  @$pb.TagNumber(6)
  $2.ActBase get act => $_getN(1);
  @$pb.TagNumber(6)
  set act($2.ActBase v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasAct() => $_has(1);
  @$pb.TagNumber(6)
  void clearAct() => clearField(6);
  @$pb.TagNumber(6)
  $2.ActBase ensureAct() => $_ensure(1);

  @$pb.TagNumber(7)
  $3.ServerAnswerTypeEnumBase get answer => $_getN(2);
  @$pb.TagNumber(7)
  set answer($3.ServerAnswerTypeEnumBase v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasAnswer() => $_has(2);
  @$pb.TagNumber(7)
  void clearAnswer() => clearField(7);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
