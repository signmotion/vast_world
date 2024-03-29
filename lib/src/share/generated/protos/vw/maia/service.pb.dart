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

import '../share/act.pb.dart' as $4;
import '../share/plan.pb.dart' as $3;
import '../share/server_answer.pb.dart' as $2;
import 'server_options.pb.dart' as $1;

class ClaimSessionRequest extends $pb.GeneratedMessage {
  factory ClaimSessionRequest({
    $core.String? uidDevice,
    $1.ServerOptionsBase? options,
    $core.bool? fixedSession,
  }) {
    final $result = create();
    if (uidDevice != null) {
      $result.uidDevice = uidDevice;
    }
    if (options != null) {
      $result.options = options;
    }
    if (fixedSession != null) {
      $result.fixedSession = fixedSession;
    }
    return $result;
  }
  ClaimSessionRequest._() : super();
  factory ClaimSessionRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ClaimSessionRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ClaimSessionRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'vw.maia'), createEmptyInstance: create)
    ..aOS(4, _omitFieldNames ? '' : 'uidDevice')
    ..aOM<$1.ServerOptionsBase>(5, _omitFieldNames ? '' : 'options', subBuilder: $1.ServerOptionsBase.create)
    ..aOB(6, _omitFieldNames ? '' : 'fixedSession')
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

  @$pb.TagNumber(5)
  $1.ServerOptionsBase get options => $_getN(1);
  @$pb.TagNumber(5)
  set options($1.ServerOptionsBase v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasOptions() => $_has(1);
  @$pb.TagNumber(5)
  void clearOptions() => clearField(5);
  @$pb.TagNumber(5)
  $1.ServerOptionsBase ensureOptions() => $_ensure(1);

  /// / Set same session between Server and Client if present.
  /// / See [fixedSessionUid].
  @$pb.TagNumber(6)
  $core.bool get fixedSession => $_getBF(2);
  @$pb.TagNumber(6)
  set fixedSession($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(6)
  $core.bool hasFixedSession() => $_has(2);
  @$pb.TagNumber(6)
  void clearFixedSession() => clearField(6);
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

class HasPlanRequest extends $pb.GeneratedMessage {
  factory HasPlanRequest({
    $core.String? session,
    $core.String? planId,
  }) {
    final $result = create();
    if (session != null) {
      $result.session = session;
    }
    if (planId != null) {
      $result.planId = planId;
    }
    return $result;
  }
  HasPlanRequest._() : super();
  factory HasPlanRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory HasPlanRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'HasPlanRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'vw.maia'), createEmptyInstance: create)
    ..aOS(3, _omitFieldNames ? '' : 'session')
    ..aOS(4, _omitFieldNames ? '' : 'planId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  HasPlanRequest clone() => HasPlanRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  HasPlanRequest copyWith(void Function(HasPlanRequest) updates) => super.copyWith((message) => updates(message as HasPlanRequest)) as HasPlanRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HasPlanRequest create() => HasPlanRequest._();
  HasPlanRequest createEmptyInstance() => create();
  static $pb.PbList<HasPlanRequest> createRepeated() => $pb.PbList<HasPlanRequest>();
  @$core.pragma('dart2js:noInline')
  static HasPlanRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<HasPlanRequest>(create);
  static HasPlanRequest? _defaultInstance;

  @$pb.TagNumber(3)
  $core.String get session => $_getSZ(0);
  @$pb.TagNumber(3)
  set session($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(3)
  $core.bool hasSession() => $_has(0);
  @$pb.TagNumber(3)
  void clearSession() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get planId => $_getSZ(1);
  @$pb.TagNumber(4)
  set planId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(4)
  $core.bool hasPlanId() => $_has(1);
  @$pb.TagNumber(4)
  void clearPlanId() => clearField(4);
}

class HasPlanResponse extends $pb.GeneratedMessage {
  factory HasPlanResponse({
    $core.bool? has,
    $2.ServerAnswer? answer,
  }) {
    final $result = create();
    if (has != null) {
      $result.has = has;
    }
    if (answer != null) {
      $result.answer = answer;
    }
    return $result;
  }
  HasPlanResponse._() : super();
  factory HasPlanResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory HasPlanResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'HasPlanResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'vw.maia'), createEmptyInstance: create)
    ..aOB(4, _omitFieldNames ? '' : 'has')
    ..aOM<$2.ServerAnswer>(7, _omitFieldNames ? '' : 'answer', subBuilder: $2.ServerAnswer.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  HasPlanResponse clone() => HasPlanResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  HasPlanResponse copyWith(void Function(HasPlanResponse) updates) => super.copyWith((message) => updates(message as HasPlanResponse)) as HasPlanResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HasPlanResponse create() => HasPlanResponse._();
  HasPlanResponse createEmptyInstance() => create();
  static $pb.PbList<HasPlanResponse> createRepeated() => $pb.PbList<HasPlanResponse>();
  @$core.pragma('dart2js:noInline')
  static HasPlanResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<HasPlanResponse>(create);
  static HasPlanResponse? _defaultInstance;

  @$pb.TagNumber(4)
  $core.bool get has => $_getBF(0);
  @$pb.TagNumber(4)
  set has($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(4)
  $core.bool hasHas() => $_has(0);
  @$pb.TagNumber(4)
  void clearHas() => clearField(4);

  @$pb.TagNumber(7)
  $2.ServerAnswer get answer => $_getN(1);
  @$pb.TagNumber(7)
  set answer($2.ServerAnswer v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasAnswer() => $_has(1);
  @$pb.TagNumber(7)
  void clearAnswer() => clearField(7);
  @$pb.TagNumber(7)
  $2.ServerAnswer ensureAnswer() => $_ensure(1);
}

class ConstructPlanRequest extends $pb.GeneratedMessage {
  factory ConstructPlanRequest({
    $core.String? session,
    $3.PlanBase? plan,
  }) {
    final $result = create();
    if (session != null) {
      $result.session = session;
    }
    if (plan != null) {
      $result.plan = plan;
    }
    return $result;
  }
  ConstructPlanRequest._() : super();
  factory ConstructPlanRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConstructPlanRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ConstructPlanRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'vw.maia'), createEmptyInstance: create)
    ..aOS(3, _omitFieldNames ? '' : 'session')
    ..aOM<$3.PlanBase>(4, _omitFieldNames ? '' : 'plan', subBuilder: $3.PlanBase.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ConstructPlanRequest clone() => ConstructPlanRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ConstructPlanRequest copyWith(void Function(ConstructPlanRequest) updates) => super.copyWith((message) => updates(message as ConstructPlanRequest)) as ConstructPlanRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConstructPlanRequest create() => ConstructPlanRequest._();
  ConstructPlanRequest createEmptyInstance() => create();
  static $pb.PbList<ConstructPlanRequest> createRepeated() => $pb.PbList<ConstructPlanRequest>();
  @$core.pragma('dart2js:noInline')
  static ConstructPlanRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ConstructPlanRequest>(create);
  static ConstructPlanRequest? _defaultInstance;

  @$pb.TagNumber(3)
  $core.String get session => $_getSZ(0);
  @$pb.TagNumber(3)
  set session($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(3)
  $core.bool hasSession() => $_has(0);
  @$pb.TagNumber(3)
  void clearSession() => clearField(3);

  @$pb.TagNumber(4)
  $3.PlanBase get plan => $_getN(1);
  @$pb.TagNumber(4)
  set plan($3.PlanBase v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasPlan() => $_has(1);
  @$pb.TagNumber(4)
  void clearPlan() => clearField(4);
  @$pb.TagNumber(4)
  $3.PlanBase ensurePlan() => $_ensure(1);
}

class ConstructPlanResponse extends $pb.GeneratedMessage {
  factory ConstructPlanResponse({
    $core.bool? constructed,
    $2.ServerAnswer? answer,
  }) {
    final $result = create();
    if (constructed != null) {
      $result.constructed = constructed;
    }
    if (answer != null) {
      $result.answer = answer;
    }
    return $result;
  }
  ConstructPlanResponse._() : super();
  factory ConstructPlanResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConstructPlanResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ConstructPlanResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'vw.maia'), createEmptyInstance: create)
    ..aOB(4, _omitFieldNames ? '' : 'constructed')
    ..aOM<$2.ServerAnswer>(7, _omitFieldNames ? '' : 'answer', subBuilder: $2.ServerAnswer.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ConstructPlanResponse clone() => ConstructPlanResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ConstructPlanResponse copyWith(void Function(ConstructPlanResponse) updates) => super.copyWith((message) => updates(message as ConstructPlanResponse)) as ConstructPlanResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConstructPlanResponse create() => ConstructPlanResponse._();
  ConstructPlanResponse createEmptyInstance() => create();
  static $pb.PbList<ConstructPlanResponse> createRepeated() => $pb.PbList<ConstructPlanResponse>();
  @$core.pragma('dart2js:noInline')
  static ConstructPlanResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ConstructPlanResponse>(create);
  static ConstructPlanResponse? _defaultInstance;

  @$pb.TagNumber(4)
  $core.bool get constructed => $_getBF(0);
  @$pb.TagNumber(4)
  set constructed($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(4)
  $core.bool hasConstructed() => $_has(0);
  @$pb.TagNumber(4)
  void clearConstructed() => clearField(4);

  @$pb.TagNumber(7)
  $2.ServerAnswer get answer => $_getN(1);
  @$pb.TagNumber(7)
  set answer($2.ServerAnswer v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasAnswer() => $_has(1);
  @$pb.TagNumber(7)
  void clearAnswer() => clearField(7);
  @$pb.TagNumber(7)
  $2.ServerAnswer ensureAnswer() => $_ensure(1);
}

class FetchPlanRequest extends $pb.GeneratedMessage {
  factory FetchPlanRequest({
    $core.String? session,
    $core.String? planId,
  }) {
    final $result = create();
    if (session != null) {
      $result.session = session;
    }
    if (planId != null) {
      $result.planId = planId;
    }
    return $result;
  }
  FetchPlanRequest._() : super();
  factory FetchPlanRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchPlanRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FetchPlanRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'vw.maia'), createEmptyInstance: create)
    ..aOS(3, _omitFieldNames ? '' : 'session')
    ..aOS(4, _omitFieldNames ? '' : 'planId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchPlanRequest clone() => FetchPlanRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchPlanRequest copyWith(void Function(FetchPlanRequest) updates) => super.copyWith((message) => updates(message as FetchPlanRequest)) as FetchPlanRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FetchPlanRequest create() => FetchPlanRequest._();
  FetchPlanRequest createEmptyInstance() => create();
  static $pb.PbList<FetchPlanRequest> createRepeated() => $pb.PbList<FetchPlanRequest>();
  @$core.pragma('dart2js:noInline')
  static FetchPlanRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchPlanRequest>(create);
  static FetchPlanRequest? _defaultInstance;

  @$pb.TagNumber(3)
  $core.String get session => $_getSZ(0);
  @$pb.TagNumber(3)
  set session($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(3)
  $core.bool hasSession() => $_has(0);
  @$pb.TagNumber(3)
  void clearSession() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get planId => $_getSZ(1);
  @$pb.TagNumber(4)
  set planId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(4)
  $core.bool hasPlanId() => $_has(1);
  @$pb.TagNumber(4)
  void clearPlanId() => clearField(4);
}

class FetchPlanResponse extends $pb.GeneratedMessage {
  factory FetchPlanResponse({
    $3.PlanBase? plan,
    $2.ServerAnswer? answer,
  }) {
    final $result = create();
    if (plan != null) {
      $result.plan = plan;
    }
    if (answer != null) {
      $result.answer = answer;
    }
    return $result;
  }
  FetchPlanResponse._() : super();
  factory FetchPlanResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchPlanResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FetchPlanResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'vw.maia'), createEmptyInstance: create)
    ..aOM<$3.PlanBase>(4, _omitFieldNames ? '' : 'plan', subBuilder: $3.PlanBase.create)
    ..aOM<$2.ServerAnswer>(7, _omitFieldNames ? '' : 'answer', subBuilder: $2.ServerAnswer.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchPlanResponse clone() => FetchPlanResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchPlanResponse copyWith(void Function(FetchPlanResponse) updates) => super.copyWith((message) => updates(message as FetchPlanResponse)) as FetchPlanResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FetchPlanResponse create() => FetchPlanResponse._();
  FetchPlanResponse createEmptyInstance() => create();
  static $pb.PbList<FetchPlanResponse> createRepeated() => $pb.PbList<FetchPlanResponse>();
  @$core.pragma('dart2js:noInline')
  static FetchPlanResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchPlanResponse>(create);
  static FetchPlanResponse? _defaultInstance;

  @$pb.TagNumber(4)
  $3.PlanBase get plan => $_getN(0);
  @$pb.TagNumber(4)
  set plan($3.PlanBase v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasPlan() => $_has(0);
  @$pb.TagNumber(4)
  void clearPlan() => clearField(4);
  @$pb.TagNumber(4)
  $3.PlanBase ensurePlan() => $_ensure(0);

  @$pb.TagNumber(7)
  $2.ServerAnswer get answer => $_getN(1);
  @$pb.TagNumber(7)
  set answer($2.ServerAnswer v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasAnswer() => $_has(1);
  @$pb.TagNumber(7)
  void clearAnswer() => clearField(7);
  @$pb.TagNumber(7)
  $2.ServerAnswer ensureAnswer() => $_ensure(1);
}

class FetchPlanIdsRequest extends $pb.GeneratedMessage {
  factory FetchPlanIdsRequest({
    $core.String? session,
  }) {
    final $result = create();
    if (session != null) {
      $result.session = session;
    }
    return $result;
  }
  FetchPlanIdsRequest._() : super();
  factory FetchPlanIdsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchPlanIdsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FetchPlanIdsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'vw.maia'), createEmptyInstance: create)
    ..aOS(3, _omitFieldNames ? '' : 'session')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchPlanIdsRequest clone() => FetchPlanIdsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchPlanIdsRequest copyWith(void Function(FetchPlanIdsRequest) updates) => super.copyWith((message) => updates(message as FetchPlanIdsRequest)) as FetchPlanIdsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FetchPlanIdsRequest create() => FetchPlanIdsRequest._();
  FetchPlanIdsRequest createEmptyInstance() => create();
  static $pb.PbList<FetchPlanIdsRequest> createRepeated() => $pb.PbList<FetchPlanIdsRequest>();
  @$core.pragma('dart2js:noInline')
  static FetchPlanIdsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchPlanIdsRequest>(create);
  static FetchPlanIdsRequest? _defaultInstance;

  @$pb.TagNumber(3)
  $core.String get session => $_getSZ(0);
  @$pb.TagNumber(3)
  set session($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(3)
  $core.bool hasSession() => $_has(0);
  @$pb.TagNumber(3)
  void clearSession() => clearField(3);
}

class FetchPlanIdsResponse extends $pb.GeneratedMessage {
  factory FetchPlanIdsResponse({
    $core.Iterable<$core.String>? planIds,
    $2.ServerAnswer? answer,
  }) {
    final $result = create();
    if (planIds != null) {
      $result.planIds.addAll(planIds);
    }
    if (answer != null) {
      $result.answer = answer;
    }
    return $result;
  }
  FetchPlanIdsResponse._() : super();
  factory FetchPlanIdsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchPlanIdsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FetchPlanIdsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'vw.maia'), createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'planIds', protoName: 'planIds')
    ..aOM<$2.ServerAnswer>(7, _omitFieldNames ? '' : 'answer', subBuilder: $2.ServerAnswer.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchPlanIdsResponse clone() => FetchPlanIdsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchPlanIdsResponse copyWith(void Function(FetchPlanIdsResponse) updates) => super.copyWith((message) => updates(message as FetchPlanIdsResponse)) as FetchPlanIdsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FetchPlanIdsResponse create() => FetchPlanIdsResponse._();
  FetchPlanIdsResponse createEmptyInstance() => create();
  static $pb.PbList<FetchPlanIdsResponse> createRepeated() => $pb.PbList<FetchPlanIdsResponse>();
  @$core.pragma('dart2js:noInline')
  static FetchPlanIdsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchPlanIdsResponse>(create);
  static FetchPlanIdsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get planIds => $_getList(0);

  @$pb.TagNumber(7)
  $2.ServerAnswer get answer => $_getN(1);
  @$pb.TagNumber(7)
  set answer($2.ServerAnswer v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasAnswer() => $_has(1);
  @$pb.TagNumber(7)
  void clearAnswer() => clearField(7);
  @$pb.TagNumber(7)
  $2.ServerAnswer ensureAnswer() => $_ensure(1);
}

class SetCurrentPlanRequest extends $pb.GeneratedMessage {
  factory SetCurrentPlanRequest({
    $core.String? session,
    $core.String? planId,
  }) {
    final $result = create();
    if (session != null) {
      $result.session = session;
    }
    if (planId != null) {
      $result.planId = planId;
    }
    return $result;
  }
  SetCurrentPlanRequest._() : super();
  factory SetCurrentPlanRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SetCurrentPlanRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SetCurrentPlanRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'vw.maia'), createEmptyInstance: create)
    ..aOS(3, _omitFieldNames ? '' : 'session')
    ..aOS(4, _omitFieldNames ? '' : 'planId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SetCurrentPlanRequest clone() => SetCurrentPlanRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SetCurrentPlanRequest copyWith(void Function(SetCurrentPlanRequest) updates) => super.copyWith((message) => updates(message as SetCurrentPlanRequest)) as SetCurrentPlanRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SetCurrentPlanRequest create() => SetCurrentPlanRequest._();
  SetCurrentPlanRequest createEmptyInstance() => create();
  static $pb.PbList<SetCurrentPlanRequest> createRepeated() => $pb.PbList<SetCurrentPlanRequest>();
  @$core.pragma('dart2js:noInline')
  static SetCurrentPlanRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SetCurrentPlanRequest>(create);
  static SetCurrentPlanRequest? _defaultInstance;

  @$pb.TagNumber(3)
  $core.String get session => $_getSZ(0);
  @$pb.TagNumber(3)
  set session($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(3)
  $core.bool hasSession() => $_has(0);
  @$pb.TagNumber(3)
  void clearSession() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get planId => $_getSZ(1);
  @$pb.TagNumber(4)
  set planId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(4)
  $core.bool hasPlanId() => $_has(1);
  @$pb.TagNumber(4)
  void clearPlanId() => clearField(4);
}

class SetCurrentPlanResponse extends $pb.GeneratedMessage {
  factory SetCurrentPlanResponse({
    $2.ServerAnswer? answer,
  }) {
    final $result = create();
    if (answer != null) {
      $result.answer = answer;
    }
    return $result;
  }
  SetCurrentPlanResponse._() : super();
  factory SetCurrentPlanResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SetCurrentPlanResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SetCurrentPlanResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'vw.maia'), createEmptyInstance: create)
    ..aOM<$2.ServerAnswer>(7, _omitFieldNames ? '' : 'answer', subBuilder: $2.ServerAnswer.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SetCurrentPlanResponse clone() => SetCurrentPlanResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SetCurrentPlanResponse copyWith(void Function(SetCurrentPlanResponse) updates) => super.copyWith((message) => updates(message as SetCurrentPlanResponse)) as SetCurrentPlanResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SetCurrentPlanResponse create() => SetCurrentPlanResponse._();
  SetCurrentPlanResponse createEmptyInstance() => create();
  static $pb.PbList<SetCurrentPlanResponse> createRepeated() => $pb.PbList<SetCurrentPlanResponse>();
  @$core.pragma('dart2js:noInline')
  static SetCurrentPlanResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SetCurrentPlanResponse>(create);
  static SetCurrentPlanResponse? _defaultInstance;

  @$pb.TagNumber(7)
  $2.ServerAnswer get answer => $_getN(0);
  @$pb.TagNumber(7)
  set answer($2.ServerAnswer v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasAnswer() => $_has(0);
  @$pb.TagNumber(7)
  void clearAnswer() => clearField(7);
  @$pb.TagNumber(7)
  $2.ServerAnswer ensureAnswer() => $_ensure(0);
}

class ActBaseRequest extends $pb.GeneratedMessage {
  factory ActBaseRequest({
    $core.String? session,
    $4.ActBase? act,
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
    ..aOM<$4.ActBase>(6, _omitFieldNames ? '' : 'act', subBuilder: $4.ActBase.create)
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
  $4.ActBase get act => $_getN(1);
  @$pb.TagNumber(6)
  set act($4.ActBase v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasAct() => $_has(1);
  @$pb.TagNumber(6)
  void clearAct() => clearField(6);
  @$pb.TagNumber(6)
  $4.ActBase ensureAct() => $_ensure(1);
}

class ActBaseResponse extends $pb.GeneratedMessage {
  factory ActBaseResponse({
    $4.ActBase? act,
    $2.ServerAnswer? answer,
  }) {
    final $result = create();
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
    ..aOM<$4.ActBase>(6, _omitFieldNames ? '' : 'act', subBuilder: $4.ActBase.create)
    ..aOM<$2.ServerAnswer>(7, _omitFieldNames ? '' : 'answer', subBuilder: $2.ServerAnswer.create)
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

  @$pb.TagNumber(6)
  $4.ActBase get act => $_getN(0);
  @$pb.TagNumber(6)
  set act($4.ActBase v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasAct() => $_has(0);
  @$pb.TagNumber(6)
  void clearAct() => clearField(6);
  @$pb.TagNumber(6)
  $4.ActBase ensureAct() => $_ensure(0);

  @$pb.TagNumber(7)
  $2.ServerAnswer get answer => $_getN(1);
  @$pb.TagNumber(7)
  set answer($2.ServerAnswer v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasAnswer() => $_has(1);
  @$pb.TagNumber(7)
  void clearAnswer() => clearField(7);
  @$pb.TagNumber(7)
  $2.ServerAnswer ensureAnswer() => $_ensure(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
