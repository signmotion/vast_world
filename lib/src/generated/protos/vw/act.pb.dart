//
//  Generated code. Do not modify.
//  source: vw/act.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'act_type_enum.pbenum.dart' as $1;
import 'component.pb.dart' as $0;

class ActBase extends $pb.GeneratedMessage {
  factory ActBase({
    $core.String? debugName,
    $core.String? uid,
    $1.ActTypeEnumBase? type,
    $core.String? planId,
    $core.Map<$core.String, $0.ComponentBase>? components,
  }) {
    final $result = create();
    if (debugName != null) {
      $result.debugName = debugName;
    }
    if (uid != null) {
      $result.uid = uid;
    }
    if (type != null) {
      $result.type = type;
    }
    if (planId != null) {
      $result.planId = planId;
    }
    if (components != null) {
      $result.components.addAll(components);
    }
    return $result;
  }
  ActBase._() : super();
  factory ActBase.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ActBase.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ActBase', package: const $pb.PackageName(_omitMessageNames ? '' : 'vw'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'debugName')
    ..aOS(2, _omitFieldNames ? '' : 'uid')
    ..e<$1.ActTypeEnumBase>(6, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: $1.ActTypeEnumBase.UNSPECIFIED_ACT_TYPE, valueOf: $1.ActTypeEnumBase.valueOf, enumValues: $1.ActTypeEnumBase.values)
    ..aOS(12, _omitFieldNames ? '' : 'planId')
    ..m<$core.String, $0.ComponentBase>(13, _omitFieldNames ? '' : 'components', entryClassName: 'ActBase.ComponentsEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OM, valueCreator: $0.ComponentBase.create, valueDefaultOrMaker: $0.ComponentBase.getDefault, packageName: const $pb.PackageName('vw'))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ActBase clone() => ActBase()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ActBase copyWith(void Function(ActBase) updates) => super.copyWith((message) => updates(message as ActBase)) as ActBase;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ActBase create() => ActBase._();
  ActBase createEmptyInstance() => create();
  static $pb.PbList<ActBase> createRepeated() => $pb.PbList<ActBase>();
  @$core.pragma('dart2js:noInline')
  static ActBase getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ActBase>(create);
  static ActBase? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get debugName => $_getSZ(0);
  @$pb.TagNumber(1)
  set debugName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDebugName() => $_has(0);
  @$pb.TagNumber(1)
  void clearDebugName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get uid => $_getSZ(1);
  @$pb.TagNumber(2)
  set uid($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUid() => $_has(1);
  @$pb.TagNumber(2)
  void clearUid() => clearField(2);

  @$pb.TagNumber(6)
  $1.ActTypeEnumBase get type => $_getN(2);
  @$pb.TagNumber(6)
  set type($1.ActTypeEnumBase v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(6)
  void clearType() => clearField(6);

  @$pb.TagNumber(12)
  $core.String get planId => $_getSZ(3);
  @$pb.TagNumber(12)
  set planId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(12)
  $core.bool hasPlanId() => $_has(3);
  @$pb.TagNumber(12)
  void clearPlanId() => clearField(12);

  /// / <component_id, ComponentBase>
  @$pb.TagNumber(13)
  $core.Map<$core.String, $0.ComponentBase> get components => $_getMap(4);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
