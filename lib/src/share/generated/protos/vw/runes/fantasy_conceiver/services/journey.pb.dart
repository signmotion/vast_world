//
//  Generated code. Do not modify.
//  source: vw/runes/fantasy_conceiver/services/journey.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../share/server_answer.pb.dart' as $5;
import '../country_description_journey.pb.dart' as $4;
import '../name_and_id_journey.pb.dart' as $6;

class ConceiveCountryDescriptionJourneyResponse extends $pb.GeneratedMessage {
  factory ConceiveCountryDescriptionJourneyResponse({
    $4.CountryDescriptionJourneyBase? data,
    $5.ServerAnswer? answer,
  }) {
    final $result = create();
    if (data != null) {
      $result.data = data;
    }
    if (answer != null) {
      $result.answer = answer;
    }
    return $result;
  }
  ConceiveCountryDescriptionJourneyResponse._() : super();
  factory ConceiveCountryDescriptionJourneyResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConceiveCountryDescriptionJourneyResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ConceiveCountryDescriptionJourneyResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'vw.runes.fantasy_conceiver'), createEmptyInstance: create)
    ..aOM<$4.CountryDescriptionJourneyBase>(1, _omitFieldNames ? '' : 'data', subBuilder: $4.CountryDescriptionJourneyBase.create)
    ..aOM<$5.ServerAnswer>(100, _omitFieldNames ? '' : 'answer', subBuilder: $5.ServerAnswer.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ConceiveCountryDescriptionJourneyResponse clone() => ConceiveCountryDescriptionJourneyResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ConceiveCountryDescriptionJourneyResponse copyWith(void Function(ConceiveCountryDescriptionJourneyResponse) updates) => super.copyWith((message) => updates(message as ConceiveCountryDescriptionJourneyResponse)) as ConceiveCountryDescriptionJourneyResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConceiveCountryDescriptionJourneyResponse create() => ConceiveCountryDescriptionJourneyResponse._();
  ConceiveCountryDescriptionJourneyResponse createEmptyInstance() => create();
  static $pb.PbList<ConceiveCountryDescriptionJourneyResponse> createRepeated() => $pb.PbList<ConceiveCountryDescriptionJourneyResponse>();
  @$core.pragma('dart2js:noInline')
  static ConceiveCountryDescriptionJourneyResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ConceiveCountryDescriptionJourneyResponse>(create);
  static ConceiveCountryDescriptionJourneyResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $4.CountryDescriptionJourneyBase get data => $_getN(0);
  @$pb.TagNumber(1)
  set data($4.CountryDescriptionJourneyBase v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasData() => $_has(0);
  @$pb.TagNumber(1)
  void clearData() => clearField(1);
  @$pb.TagNumber(1)
  $4.CountryDescriptionJourneyBase ensureData() => $_ensure(0);

  @$pb.TagNumber(100)
  $5.ServerAnswer get answer => $_getN(1);
  @$pb.TagNumber(100)
  set answer($5.ServerAnswer v) { setField(100, v); }
  @$pb.TagNumber(100)
  $core.bool hasAnswer() => $_has(1);
  @$pb.TagNumber(100)
  void clearAnswer() => clearField(100);
  @$pb.TagNumber(100)
  $5.ServerAnswer ensureAnswer() => $_ensure(1);
}

class ConceiveNameAndIdJourneyResponse extends $pb.GeneratedMessage {
  factory ConceiveNameAndIdJourneyResponse({
    $6.NameAndIdJourneyBase? data,
    $5.ServerAnswer? answer,
  }) {
    final $result = create();
    if (data != null) {
      $result.data = data;
    }
    if (answer != null) {
      $result.answer = answer;
    }
    return $result;
  }
  ConceiveNameAndIdJourneyResponse._() : super();
  factory ConceiveNameAndIdJourneyResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConceiveNameAndIdJourneyResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ConceiveNameAndIdJourneyResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'vw.runes.fantasy_conceiver'), createEmptyInstance: create)
    ..aOM<$6.NameAndIdJourneyBase>(1, _omitFieldNames ? '' : 'data', subBuilder: $6.NameAndIdJourneyBase.create)
    ..aOM<$5.ServerAnswer>(100, _omitFieldNames ? '' : 'answer', subBuilder: $5.ServerAnswer.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ConceiveNameAndIdJourneyResponse clone() => ConceiveNameAndIdJourneyResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ConceiveNameAndIdJourneyResponse copyWith(void Function(ConceiveNameAndIdJourneyResponse) updates) => super.copyWith((message) => updates(message as ConceiveNameAndIdJourneyResponse)) as ConceiveNameAndIdJourneyResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConceiveNameAndIdJourneyResponse create() => ConceiveNameAndIdJourneyResponse._();
  ConceiveNameAndIdJourneyResponse createEmptyInstance() => create();
  static $pb.PbList<ConceiveNameAndIdJourneyResponse> createRepeated() => $pb.PbList<ConceiveNameAndIdJourneyResponse>();
  @$core.pragma('dart2js:noInline')
  static ConceiveNameAndIdJourneyResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ConceiveNameAndIdJourneyResponse>(create);
  static ConceiveNameAndIdJourneyResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $6.NameAndIdJourneyBase get data => $_getN(0);
  @$pb.TagNumber(1)
  set data($6.NameAndIdJourneyBase v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasData() => $_has(0);
  @$pb.TagNumber(1)
  void clearData() => clearField(1);
  @$pb.TagNumber(1)
  $6.NameAndIdJourneyBase ensureData() => $_ensure(0);

  @$pb.TagNumber(100)
  $5.ServerAnswer get answer => $_getN(1);
  @$pb.TagNumber(100)
  set answer($5.ServerAnswer v) { setField(100, v); }
  @$pb.TagNumber(100)
  $core.bool hasAnswer() => $_has(1);
  @$pb.TagNumber(100)
  void clearAnswer() => clearField(100);
  @$pb.TagNumber(100)
  $5.ServerAnswer ensureAnswer() => $_ensure(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
