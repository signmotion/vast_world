//
//  Generated code. Do not modify.
//  source: vw/runes/fantasy_journey_conceiver/services/journey.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../share/server_answer.pb.dart' as $4;

class conceiveNameAndIdJourneyResponse extends $pb.GeneratedMessage {
  factory conceiveNameAndIdJourneyResponse({
    $core.String? planHid,
    $core.String? planUid,
    $core.String? title,
    $core.String? synopsis,
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
    if (synopsis != null) {
      $result.synopsis = synopsis;
    }
    if (answer != null) {
      $result.answer = answer;
    }
    return $result;
  }
  conceiveNameAndIdJourneyResponse._() : super();
  factory conceiveNameAndIdJourneyResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory conceiveNameAndIdJourneyResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'conceiveNameAndIdJourneyResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'vw.runes.fantasy_journey_conceiver'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'planHid')
    ..aOS(2, _omitFieldNames ? '' : 'planUid')
    ..aOS(12, _omitFieldNames ? '' : 'title')
    ..aOS(13, _omitFieldNames ? '' : 'synopsis')
    ..aOM<$4.ServerAnswer>(100, _omitFieldNames ? '' : 'answer', subBuilder: $4.ServerAnswer.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  conceiveNameAndIdJourneyResponse clone() => conceiveNameAndIdJourneyResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  conceiveNameAndIdJourneyResponse copyWith(void Function(conceiveNameAndIdJourneyResponse) updates) => super.copyWith((message) => updates(message as conceiveNameAndIdJourneyResponse)) as conceiveNameAndIdJourneyResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static conceiveNameAndIdJourneyResponse create() => conceiveNameAndIdJourneyResponse._();
  conceiveNameAndIdJourneyResponse createEmptyInstance() => create();
  static $pb.PbList<conceiveNameAndIdJourneyResponse> createRepeated() => $pb.PbList<conceiveNameAndIdJourneyResponse>();
  @$core.pragma('dart2js:noInline')
  static conceiveNameAndIdJourneyResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<conceiveNameAndIdJourneyResponse>(create);
  static conceiveNameAndIdJourneyResponse? _defaultInstance;

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
  $core.String get synopsis => $_getSZ(3);
  @$pb.TagNumber(13)
  set synopsis($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(13)
  $core.bool hasSynopsis() => $_has(3);
  @$pb.TagNumber(13)
  void clearSynopsis() => clearField(13);

  @$pb.TagNumber(100)
  $4.ServerAnswer get answer => $_getN(4);
  @$pb.TagNumber(100)
  set answer($4.ServerAnswer v) { setField(100, v); }
  @$pb.TagNumber(100)
  $core.bool hasAnswer() => $_has(4);
  @$pb.TagNumber(100)
  void clearAnswer() => clearField(100);
  @$pb.TagNumber(100)
  $4.ServerAnswer ensureAnswer() => $_ensure(4);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
