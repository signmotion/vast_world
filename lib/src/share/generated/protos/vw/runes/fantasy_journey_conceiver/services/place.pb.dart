//
//  Generated code. Do not modify.
//  source: vw/runes/fantasy_journey_conceiver/services/place.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../share/server_answer.pb.dart' as $4;

class conceiveNameAndIdPlaceResponse extends $pb.GeneratedMessage {
  factory conceiveNameAndIdPlaceResponse({
    $core.String? planHid,
    $core.String? planUid,
    $core.String? title,
    $core.String? description,
    $core.Map<$core.String, $core.String>? predominantColors,
    $4.ServerAnswer? answer,
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
    if (answer != null) {
      $result.answer = answer;
    }
    return $result;
  }
  conceiveNameAndIdPlaceResponse._() : super();
  factory conceiveNameAndIdPlaceResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory conceiveNameAndIdPlaceResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'conceiveNameAndIdPlaceResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'vw.runes.fantasy_journey_conceiver'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'planHid')
    ..aOS(2, _omitFieldNames ? '' : 'planUid')
    ..aOS(12, _omitFieldNames ? '' : 'title')
    ..aOS(13, _omitFieldNames ? '' : 'description')
    ..m<$core.String, $core.String>(20, _omitFieldNames ? '' : 'predominantColors', entryClassName: 'conceiveNameAndIdPlaceResponse.PredominantColorsEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('vw.runes.fantasy_journey_conceiver'))
    ..aOM<$4.ServerAnswer>(100, _omitFieldNames ? '' : 'answer', subBuilder: $4.ServerAnswer.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  conceiveNameAndIdPlaceResponse clone() => conceiveNameAndIdPlaceResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  conceiveNameAndIdPlaceResponse copyWith(void Function(conceiveNameAndIdPlaceResponse) updates) => super.copyWith((message) => updates(message as conceiveNameAndIdPlaceResponse)) as conceiveNameAndIdPlaceResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static conceiveNameAndIdPlaceResponse create() => conceiveNameAndIdPlaceResponse._();
  conceiveNameAndIdPlaceResponse createEmptyInstance() => create();
  static $pb.PbList<conceiveNameAndIdPlaceResponse> createRepeated() => $pb.PbList<conceiveNameAndIdPlaceResponse>();
  @$core.pragma('dart2js:noInline')
  static conceiveNameAndIdPlaceResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<conceiveNameAndIdPlaceResponse>(create);
  static conceiveNameAndIdPlaceResponse? _defaultInstance;

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

  /// / <name, #RRGGBBAA>
  @$pb.TagNumber(20)
  $core.Map<$core.String, $core.String> get predominantColors => $_getMap(4);

  @$pb.TagNumber(100)
  $4.ServerAnswer get answer => $_getN(5);
  @$pb.TagNumber(100)
  set answer($4.ServerAnswer v) { setField(100, v); }
  @$pb.TagNumber(100)
  $core.bool hasAnswer() => $_has(5);
  @$pb.TagNumber(100)
  void clearAnswer() => clearField(100);
  @$pb.TagNumber(100)
  $4.ServerAnswer ensureAnswer() => $_ensure(5);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
