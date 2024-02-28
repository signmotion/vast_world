//
//  Generated code. Do not modify.
//  source: vw/runes/fantasy_conceiver/name_and_id_story.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class NameAndIdStoryBase extends $pb.GeneratedMessage {
  factory NameAndIdStoryBase({
    $core.String? planHid,
    $core.String? planUid,
    $core.String? title,
    $core.String? text,
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
    if (text != null) {
      $result.text = text;
    }
    return $result;
  }
  NameAndIdStoryBase._() : super();
  factory NameAndIdStoryBase.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NameAndIdStoryBase.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'NameAndIdStoryBase', package: const $pb.PackageName(_omitMessageNames ? '' : 'vw.runes.fantasy_conceiver'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'planHid')
    ..aOS(2, _omitFieldNames ? '' : 'planUid')
    ..aOS(12, _omitFieldNames ? '' : 'title')
    ..aOS(13, _omitFieldNames ? '' : 'text')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NameAndIdStoryBase clone() => NameAndIdStoryBase()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NameAndIdStoryBase copyWith(void Function(NameAndIdStoryBase) updates) => super.copyWith((message) => updates(message as NameAndIdStoryBase)) as NameAndIdStoryBase;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NameAndIdStoryBase create() => NameAndIdStoryBase._();
  NameAndIdStoryBase createEmptyInstance() => create();
  static $pb.PbList<NameAndIdStoryBase> createRepeated() => $pb.PbList<NameAndIdStoryBase>();
  @$core.pragma('dart2js:noInline')
  static NameAndIdStoryBase getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NameAndIdStoryBase>(create);
  static NameAndIdStoryBase? _defaultInstance;

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
  $core.String get text => $_getSZ(3);
  @$pb.TagNumber(13)
  set text($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(13)
  $core.bool hasText() => $_has(3);
  @$pb.TagNumber(13)
  void clearText() => clearField(13);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
