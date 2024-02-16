//
//  Generated code. Do not modify.
//  source: vw/maia/server_state.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'server_options.pb.dart' as $1;

/// / Use for Server only.
class ServerStateBase extends $pb.GeneratedMessage {
  factory ServerStateBase({
    $core.Map<$core.String, $1.ServerOptionsBase>? options,
    $core.Map<$core.String, $core.String>? claimedSessionsDevices,
    $core.Map<$core.String, $core.bool>? approvedSessions,
    $core.Map<$core.String, $core.String>? currentPlanIds,
  }) {
    final $result = create();
    if (options != null) {
      $result.options.addAll(options);
    }
    if (claimedSessionsDevices != null) {
      $result.claimedSessionsDevices.addAll(claimedSessionsDevices);
    }
    if (approvedSessions != null) {
      $result.approvedSessions.addAll(approvedSessions);
    }
    if (currentPlanIds != null) {
      $result.currentPlanIds.addAll(currentPlanIds);
    }
    return $result;
  }
  ServerStateBase._() : super();
  factory ServerStateBase.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ServerStateBase.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ServerStateBase', package: const $pb.PackageName(_omitMessageNames ? '' : 'vw.maia'), createEmptyInstance: create)
    ..m<$core.String, $1.ServerOptionsBase>(1, _omitFieldNames ? '' : 'options', entryClassName: 'ServerStateBase.OptionsEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OM, valueCreator: $1.ServerOptionsBase.create, valueDefaultOrMaker: $1.ServerOptionsBase.getDefault, packageName: const $pb.PackageName('vw.maia'))
    ..m<$core.String, $core.String>(2, _omitFieldNames ? '' : 'claimedSessionsDevices', entryClassName: 'ServerStateBase.ClaimedSessionsDevicesEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('vw.maia'))
    ..m<$core.String, $core.bool>(3, _omitFieldNames ? '' : 'approvedSessions', entryClassName: 'ServerStateBase.ApprovedSessionsEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OB, packageName: const $pb.PackageName('vw.maia'))
    ..m<$core.String, $core.String>(200, _omitFieldNames ? '' : 'currentPlanIds', entryClassName: 'ServerStateBase.CurrentPlanIdsEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('vw.maia'))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ServerStateBase clone() => ServerStateBase()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ServerStateBase copyWith(void Function(ServerStateBase) updates) => super.copyWith((message) => updates(message as ServerStateBase)) as ServerStateBase;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ServerStateBase create() => ServerStateBase._();
  ServerStateBase createEmptyInstance() => create();
  static $pb.PbList<ServerStateBase> createRepeated() => $pb.PbList<ServerStateBase>();
  @$core.pragma('dart2js:noInline')
  static ServerStateBase getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ServerStateBase>(create);
  static ServerStateBase? _defaultInstance;

  /// / Respect the options for each session.
  /// / <session, ServerOptionsBase>
  @$pb.TagNumber(1)
  $core.Map<$core.String, $1.ServerOptionsBase> get options => $_getMap(0);

  /// / The sessions that the Client requested (claimed) from Server.
  /// / <session, uidDevice>
  @$pb.TagNumber(2)
  $core.Map<$core.String, $core.String> get claimedSessionsDevices => $_getMap(1);

  /// / The sessions that the Server has approved to Clients.
  /// / <session, true>
  @$pb.TagNumber(3)
  $core.Map<$core.String, $core.bool> get approvedSessions => $_getMap(2);

  /// / <session, planId>
  @$pb.TagNumber(200)
  $core.Map<$core.String, $core.String> get currentPlanIds => $_getMap(3);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
