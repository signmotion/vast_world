//
//  Generated code. Do not modify.
//  source: vw/component.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ComponentBase extends $pb.GeneratedMessage {
  factory ComponentBase({
    $core.String? hid,
    $core.String? uid,
    $core.String? sjsonValue,
  }) {
    final $result = create();
    if (hid != null) {
      $result.hid = hid;
    }
    if (uid != null) {
      $result.uid = uid;
    }
    if (sjsonValue != null) {
      $result.sjsonValue = sjsonValue;
    }
    return $result;
  }
  ComponentBase._() : super();
  factory ComponentBase.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ComponentBase.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ComponentBase', package: const $pb.PackageName(_omitMessageNames ? '' : 'vw'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'hid')
    ..aOS(2, _omitFieldNames ? '' : 'uid')
    ..aOS(12, _omitFieldNames ? '' : 'sjsonValue')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ComponentBase clone() => ComponentBase()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ComponentBase copyWith(void Function(ComponentBase) updates) => super.copyWith((message) => updates(message as ComponentBase)) as ComponentBase;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ComponentBase create() => ComponentBase._();
  ComponentBase createEmptyInstance() => create();
  static $pb.PbList<ComponentBase> createRepeated() => $pb.PbList<ComponentBase>();
  @$core.pragma('dart2js:noInline')
  static ComponentBase getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ComponentBase>(create);
  static ComponentBase? _defaultInstance;

  /// / HID of this component.
  @$pb.TagNumber(1)
  $core.String get hid => $_getSZ(0);
  @$pb.TagNumber(1)
  set hid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHid() => $_has(0);
  @$pb.TagNumber(1)
  void clearHid() => clearField(1);

  /// / UID of this component.
  @$pb.TagNumber(2)
  $core.String get uid => $_getSZ(1);
  @$pb.TagNumber(2)
  set uid($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUid() => $_has(1);
  @$pb.TagNumber(2)
  void clearUid() => clearField(2);

  /// / To stringify JSON because we have a boilerplate code
  /// / with protobuf map and any-value.
  @$pb.TagNumber(12)
  $core.String get sjsonValue => $_getSZ(2);
  @$pb.TagNumber(12)
  set sjsonValue($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(12)
  $core.bool hasSjsonValue() => $_has(2);
  @$pb.TagNumber(12)
  void clearSjsonValue() => clearField(12);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
