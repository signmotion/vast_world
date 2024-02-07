//
//  Generated code. Do not modify.
//  source: vw/hermes/client_state.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'client_state_enum.pbenum.dart' as $0;

/// / Use for Client's App only.
class ClientStateBase extends $pb.GeneratedMessage {
  factory ClientStateBase({
    $0.ClientStateEnumBase? state,
    $core.String? uidDevice,
    $core.String? session,
    $core.bool? sessionApproved,
    $core.String? nameServer,
    $core.String? currentPlanId,
  }) {
    final $result = create();
    if (state != null) {
      $result.state = state;
    }
    if (uidDevice != null) {
      $result.uidDevice = uidDevice;
    }
    if (session != null) {
      $result.session = session;
    }
    if (sessionApproved != null) {
      $result.sessionApproved = sessionApproved;
    }
    if (nameServer != null) {
      $result.nameServer = nameServer;
    }
    if (currentPlanId != null) {
      $result.currentPlanId = currentPlanId;
    }
    return $result;
  }
  ClientStateBase._() : super();
  factory ClientStateBase.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ClientStateBase.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ClientStateBase', package: const $pb.PackageName(_omitMessageNames ? '' : 'vw.hermes'), createEmptyInstance: create)
    ..e<$0.ClientStateEnumBase>(1, _omitFieldNames ? '' : 'state', $pb.PbFieldType.OE, defaultOrMaker: $0.ClientStateEnumBase.UNSPECIFIED_CLIENT_STATE, valueOf: $0.ClientStateEnumBase.valueOf, enumValues: $0.ClientStateEnumBase.values)
    ..aOS(2, _omitFieldNames ? '' : 'uidDevice', protoName: 'uidDevice')
    ..aOS(3, _omitFieldNames ? '' : 'session')
    ..aOB(4, _omitFieldNames ? '' : 'sessionApproved')
    ..aOS(100, _omitFieldNames ? '' : 'nameServer')
    ..aOS(200, _omitFieldNames ? '' : 'currentPlanId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ClientStateBase clone() => ClientStateBase()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ClientStateBase copyWith(void Function(ClientStateBase) updates) => super.copyWith((message) => updates(message as ClientStateBase)) as ClientStateBase;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ClientStateBase create() => ClientStateBase._();
  ClientStateBase createEmptyInstance() => create();
  static $pb.PbList<ClientStateBase> createRepeated() => $pb.PbList<ClientStateBase>();
  @$core.pragma('dart2js:noInline')
  static ClientStateBase getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ClientStateBase>(create);
  static ClientStateBase? _defaultInstance;

  @$pb.TagNumber(1)
  $0.ClientStateEnumBase get state => $_getN(0);
  @$pb.TagNumber(1)
  set state($0.ClientStateEnumBase v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasState() => $_has(0);
  @$pb.TagNumber(1)
  void clearState() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get uidDevice => $_getSZ(1);
  @$pb.TagNumber(2)
  set uidDevice($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUidDevice() => $_has(1);
  @$pb.TagNumber(2)
  void clearUidDevice() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get session => $_getSZ(2);
  @$pb.TagNumber(3)
  set session($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSession() => $_has(2);
  @$pb.TagNumber(3)
  void clearSession() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get sessionApproved => $_getBF(3);
  @$pb.TagNumber(4)
  set sessionApproved($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSessionApproved() => $_has(3);
  @$pb.TagNumber(4)
  void clearSessionApproved() => clearField(4);

  @$pb.TagNumber(100)
  $core.String get nameServer => $_getSZ(4);
  @$pb.TagNumber(100)
  set nameServer($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(100)
  $core.bool hasNameServer() => $_has(4);
  @$pb.TagNumber(100)
  void clearNameServer() => clearField(100);

  @$pb.TagNumber(200)
  $core.String get currentPlanId => $_getSZ(5);
  @$pb.TagNumber(200)
  set currentPlanId($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(200)
  $core.bool hasCurrentPlanId() => $_has(5);
  @$pb.TagNumber(200)
  void clearCurrentPlanId() => clearField(200);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
