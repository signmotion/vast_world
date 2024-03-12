//
//  Generated code. Do not modify.
//  source: vw/runes/fantasy_conceiver/country_description_journey.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class CountryDescriptionJourneyBase extends $pb.GeneratedMessage {
  factory CountryDescriptionJourneyBase({
    $core.String? description,
  }) {
    final $result = create();
    if (description != null) {
      $result.description = description;
    }
    return $result;
  }
  CountryDescriptionJourneyBase._() : super();
  factory CountryDescriptionJourneyBase.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CountryDescriptionJourneyBase.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CountryDescriptionJourneyBase', package: const $pb.PackageName(_omitMessageNames ? '' : 'vw.runes.fantasy_conceiver'), createEmptyInstance: create)
    ..aOS(13, _omitFieldNames ? '' : 'description')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CountryDescriptionJourneyBase clone() => CountryDescriptionJourneyBase()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CountryDescriptionJourneyBase copyWith(void Function(CountryDescriptionJourneyBase) updates) => super.copyWith((message) => updates(message as CountryDescriptionJourneyBase)) as CountryDescriptionJourneyBase;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CountryDescriptionJourneyBase create() => CountryDescriptionJourneyBase._();
  CountryDescriptionJourneyBase createEmptyInstance() => create();
  static $pb.PbList<CountryDescriptionJourneyBase> createRepeated() => $pb.PbList<CountryDescriptionJourneyBase>();
  @$core.pragma('dart2js:noInline')
  static CountryDescriptionJourneyBase getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CountryDescriptionJourneyBase>(create);
  static CountryDescriptionJourneyBase? _defaultInstance;

  @$pb.TagNumber(13)
  $core.String get description => $_getSZ(0);
  @$pb.TagNumber(13)
  set description($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(13)
  $core.bool hasDescription() => $_has(0);
  @$pb.TagNumber(13)
  void clearDescription() => clearField(13);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
