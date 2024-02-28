//
//  Generated code. Do not modify.
//  source: vw/runes/fantasy_conceiver/name_and_id_place.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class NameAndIdPlaceBase extends $pb.GeneratedMessage {
  factory NameAndIdPlaceBase({
    $core.String? planHid,
    $core.String? planUid,
    $core.String? title,
    $core.String? description,
    $core.Map<$core.String, $core.int>? predominantColors,
  }) {
    final $result = create();
    if (planHid != null) {
      $result.planHid = planHid;
    }
    if (planUid != null) {
      $result.planUid = planUid;
    }
    if (title != null) {
      $result.title = title;
    }
    if (description != null) {
      $result.description = description;
    }
    if (predominantColors != null) {
      $result.predominantColors.addAll(predominantColors);
    }
    return $result;
  }
  NameAndIdPlaceBase._() : super();
  factory NameAndIdPlaceBase.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NameAndIdPlaceBase.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'NameAndIdPlaceBase', package: const $pb.PackageName(_omitMessageNames ? '' : 'vw.runes.fantasy_conceiver'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'planHid')
    ..aOS(2, _omitFieldNames ? '' : 'planUid')
    ..aOS(12, _omitFieldNames ? '' : 'title')
    ..aOS(13, _omitFieldNames ? '' : 'description')
    ..m<$core.String, $core.int>(20, _omitFieldNames ? '' : 'predominantColors', entryClassName: 'NameAndIdPlaceBase.PredominantColorsEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.O3, packageName: const $pb.PackageName('vw.runes.fantasy_conceiver'))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NameAndIdPlaceBase clone() => NameAndIdPlaceBase()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NameAndIdPlaceBase copyWith(void Function(NameAndIdPlaceBase) updates) => super.copyWith((message) => updates(message as NameAndIdPlaceBase)) as NameAndIdPlaceBase;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NameAndIdPlaceBase create() => NameAndIdPlaceBase._();
  NameAndIdPlaceBase createEmptyInstance() => create();
  static $pb.PbList<NameAndIdPlaceBase> createRepeated() => $pb.PbList<NameAndIdPlaceBase>();
  @$core.pragma('dart2js:noInline')
  static NameAndIdPlaceBase getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NameAndIdPlaceBase>(create);
  static NameAndIdPlaceBase? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get planHid => $_getSZ(0);
  @$pb.TagNumber(1)
  set planHid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPlanHid() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlanHid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get planUid => $_getSZ(1);
  @$pb.TagNumber(2)
  set planUid($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPlanUid() => $_has(1);
  @$pb.TagNumber(2)
  void clearPlanUid() => clearField(2);

  @$pb.TagNumber(12)
  $core.String get title => $_getSZ(2);
  @$pb.TagNumber(12)
  set title($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(12)
  $core.bool hasTitle() => $_has(2);
  @$pb.TagNumber(12)
  void clearTitle() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get description => $_getSZ(3);
  @$pb.TagNumber(13)
  set description($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(13)
  $core.bool hasDescription() => $_has(3);
  @$pb.TagNumber(13)
  void clearDescription() => clearField(13);

  /// / <name, RGB as int8>
  @$pb.TagNumber(20)
  $core.Map<$core.String, $core.int> get predominantColors => $_getMap(4);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
