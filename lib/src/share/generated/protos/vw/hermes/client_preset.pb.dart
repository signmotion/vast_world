//
//  Generated code. Do not modify.
//  source: vw/hermes/client_preset.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// / Preset (options) for Client's App.
class ClientPresetBase extends $pb.GeneratedMessage {
  factory ClientPresetBase({
    $core.String? appTitle,
    $core.String? darkThemePageTitle,
    $core.String? lightThemePageTitle,
    $core.String? serverHost,
    $core.int? serverPort,
    $core.bool? showAppState,
    $core.bool? showNumberMessage,
    $core.bool? showDebugMessages,
    $core.bool? showDebugDetailsMessage,
  }) {
    final $result = create();
    if (appTitle != null) {
      $result.appTitle = appTitle;
    }
    if (darkThemePageTitle != null) {
      $result.darkThemePageTitle = darkThemePageTitle;
    }
    if (lightThemePageTitle != null) {
      $result.lightThemePageTitle = lightThemePageTitle;
    }
    if (serverHost != null) {
      $result.serverHost = serverHost;
    }
    if (serverPort != null) {
      $result.serverPort = serverPort;
    }
    if (showAppState != null) {
      $result.showAppState = showAppState;
    }
    if (showNumberMessage != null) {
      $result.showNumberMessage = showNumberMessage;
    }
    if (showDebugMessages != null) {
      $result.showDebugMessages = showDebugMessages;
    }
    if (showDebugDetailsMessage != null) {
      $result.showDebugDetailsMessage = showDebugDetailsMessage;
    }
    return $result;
  }
  ClientPresetBase._() : super();
  factory ClientPresetBase.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ClientPresetBase.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ClientPresetBase', package: const $pb.PackageName(_omitMessageNames ? '' : 'vw.hermes'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'appTitle')
    ..aOS(2, _omitFieldNames ? '' : 'darkThemePageTitle')
    ..aOS(3, _omitFieldNames ? '' : 'lightThemePageTitle')
    ..aOS(5, _omitFieldNames ? '' : 'serverHost')
    ..a<$core.int>(6, _omitFieldNames ? '' : 'serverPort', $pb.PbFieldType.O3)
    ..aOB(102, _omitFieldNames ? '' : 'showAppState')
    ..aOB(103, _omitFieldNames ? '' : 'showNumberMessage')
    ..aOB(104, _omitFieldNames ? '' : 'showDebugMessages')
    ..aOB(105, _omitFieldNames ? '' : 'showDebugDetailsMessage')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ClientPresetBase clone() => ClientPresetBase()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ClientPresetBase copyWith(void Function(ClientPresetBase) updates) => super.copyWith((message) => updates(message as ClientPresetBase)) as ClientPresetBase;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ClientPresetBase create() => ClientPresetBase._();
  ClientPresetBase createEmptyInstance() => create();
  static $pb.PbList<ClientPresetBase> createRepeated() => $pb.PbList<ClientPresetBase>();
  @$core.pragma('dart2js:noInline')
  static ClientPresetBase getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ClientPresetBase>(create);
  static ClientPresetBase? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get appTitle => $_getSZ(0);
  @$pb.TagNumber(1)
  set appTitle($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAppTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearAppTitle() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get darkThemePageTitle => $_getSZ(1);
  @$pb.TagNumber(2)
  set darkThemePageTitle($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDarkThemePageTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearDarkThemePageTitle() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get lightThemePageTitle => $_getSZ(2);
  @$pb.TagNumber(3)
  set lightThemePageTitle($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLightThemePageTitle() => $_has(2);
  @$pb.TagNumber(3)
  void clearLightThemePageTitle() => clearField(3);

  @$pb.TagNumber(5)
  $core.String get serverHost => $_getSZ(3);
  @$pb.TagNumber(5)
  set serverHost($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(5)
  $core.bool hasServerHost() => $_has(3);
  @$pb.TagNumber(5)
  void clearServerHost() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get serverPort => $_getIZ(4);
  @$pb.TagNumber(6)
  set serverPort($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(6)
  $core.bool hasServerPort() => $_has(4);
  @$pb.TagNumber(6)
  void clearServerPort() => clearField(6);

  @$pb.TagNumber(102)
  $core.bool get showAppState => $_getBF(5);
  @$pb.TagNumber(102)
  set showAppState($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(102)
  $core.bool hasShowAppState() => $_has(5);
  @$pb.TagNumber(102)
  void clearShowAppState() => clearField(102);

  @$pb.TagNumber(103)
  $core.bool get showNumberMessage => $_getBF(6);
  @$pb.TagNumber(103)
  set showNumberMessage($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(103)
  $core.bool hasShowNumberMessage() => $_has(6);
  @$pb.TagNumber(103)
  void clearShowNumberMessage() => clearField(103);

  @$pb.TagNumber(104)
  $core.bool get showDebugMessages => $_getBF(7);
  @$pb.TagNumber(104)
  set showDebugMessages($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(104)
  $core.bool hasShowDebugMessages() => $_has(7);
  @$pb.TagNumber(104)
  void clearShowDebugMessages() => clearField(104);

  @$pb.TagNumber(105)
  $core.bool get showDebugDetailsMessage => $_getBF(8);
  @$pb.TagNumber(105)
  set showDebugDetailsMessage($core.bool v) { $_setBool(8, v); }
  @$pb.TagNumber(105)
  $core.bool hasShowDebugDetailsMessage() => $_has(8);
  @$pb.TagNumber(105)
  void clearShowDebugDetailsMessage() => clearField(105);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
