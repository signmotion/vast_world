//
//  Generated code. Do not modify.
//  source: vw/plan.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'component.pb.dart' as $0;

class PlanBase extends $pb.GeneratedMessage {
  factory PlanBase({
    $core.String? hid,
    $core.String? uid,
    $core.Map<$core.String, $0.ComponentBase>? components,
    $core.Map<$core.String, PlanBase>? exposed,
  }) {
    final $result = create();
    if (hid != null) {
      $result.hid = hid;
    }
    if (uid != null) {
      $result.uid = uid;
    }
    if (components != null) {
      $result.components.addAll(components);
    }
    if (exposed != null) {
      $result.exposed.addAll(exposed);
    }
    return $result;
  }
  PlanBase._() : super();
  factory PlanBase.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PlanBase.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PlanBase', package: const $pb.PackageName(_omitMessageNames ? '' : 'vw'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'hid')
    ..aOS(2, _omitFieldNames ? '' : 'uid')
    ..m<$core.String, $0.ComponentBase>(10, _omitFieldNames ? '' : 'components', entryClassName: 'PlanBase.ComponentsEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OM, valueCreator: $0.ComponentBase.create, valueDefaultOrMaker: $0.ComponentBase.getDefault, packageName: const $pb.PackageName('vw'))
    ..m<$core.String, PlanBase>(12, _omitFieldNames ? '' : 'exposed', entryClassName: 'PlanBase.ExposedEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OM, valueCreator: PlanBase.create, valueDefaultOrMaker: PlanBase.getDefault, packageName: const $pb.PackageName('vw'))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PlanBase clone() => PlanBase()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PlanBase copyWith(void Function(PlanBase) updates) => super.copyWith((message) => updates(message as PlanBase)) as PlanBase;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PlanBase create() => PlanBase._();
  PlanBase createEmptyInstance() => create();
  static $pb.PbList<PlanBase> createRepeated() => $pb.PbList<PlanBase>();
  @$core.pragma('dart2js:noInline')
  static PlanBase getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PlanBase>(create);
  static PlanBase? _defaultInstance;

  /// / The HID and UID has also duplicated into [components] as [IdComponent].
  @$pb.TagNumber(1)
  $core.String get hid => $_getSZ(0);
  @$pb.TagNumber(1)
  set hid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHid() => $_has(0);
  @$pb.TagNumber(1)
  void clearHid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get uid => $_getSZ(1);
  @$pb.TagNumber(2)
  set uid($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUid() => $_has(1);
  @$pb.TagNumber(2)
  void clearUid() => clearField(2);

  /// / <componentId, ComponentBase>
  @$pb.TagNumber(10)
  $core.Map<$core.String, $0.ComponentBase> get components => $_getMap(2);

  /// / <planId, planBase>
  @$pb.TagNumber(12)
  $core.Map<$core.String, PlanBase> get exposed => $_getMap(3);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
