//
//  Generated code. Do not modify.
//  source: vw/runes/fantasy_country_conceiver/content.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../syrokomskyi/type/image.pb.dart' as $4;

/// / The Server keeps rune content (value) by Client sessions.
class ContentBase extends $pb.GeneratedMessage {
  factory ContentBase({
    $core.String? descriptionCountry,
    $4.Image? imageFirstPlaceCountry,
    $core.String? nameCountry,
  }) {
    final $result = create();
    if (descriptionCountry != null) {
      $result.descriptionCountry = descriptionCountry;
    }
    if (imageFirstPlaceCountry != null) {
      $result.imageFirstPlaceCountry = imageFirstPlaceCountry;
    }
    if (nameCountry != null) {
      $result.nameCountry = nameCountry;
    }
    return $result;
  }
  ContentBase._() : super();
  factory ContentBase.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ContentBase.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ContentBase', package: const $pb.PackageName(_omitMessageNames ? '' : 'vw.runes.fantasy_country_conceiver'), createEmptyInstance: create)
    ..aOS(2, _omitFieldNames ? '' : 'descriptionCountry')
    ..aOM<$4.Image>(3, _omitFieldNames ? '' : 'imageFirstPlaceCountry', subBuilder: $4.Image.create)
    ..aOS(4, _omitFieldNames ? '' : 'nameCountry')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ContentBase clone() => ContentBase()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ContentBase copyWith(void Function(ContentBase) updates) => super.copyWith((message) => updates(message as ContentBase)) as ContentBase;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ContentBase create() => ContentBase._();
  ContentBase createEmptyInstance() => create();
  static $pb.PbList<ContentBase> createRepeated() => $pb.PbList<ContentBase>();
  @$core.pragma('dart2js:noInline')
  static ContentBase getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ContentBase>(create);
  static ContentBase? _defaultInstance;

  @$pb.TagNumber(2)
  $core.String get descriptionCountry => $_getSZ(0);
  @$pb.TagNumber(2)
  set descriptionCountry($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(2)
  $core.bool hasDescriptionCountry() => $_has(0);
  @$pb.TagNumber(2)
  void clearDescriptionCountry() => clearField(2);

  @$pb.TagNumber(3)
  $4.Image get imageFirstPlaceCountry => $_getN(1);
  @$pb.TagNumber(3)
  set imageFirstPlaceCountry($4.Image v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasImageFirstPlaceCountry() => $_has(1);
  @$pb.TagNumber(3)
  void clearImageFirstPlaceCountry() => clearField(3);
  @$pb.TagNumber(3)
  $4.Image ensureImageFirstPlaceCountry() => $_ensure(1);

  @$pb.TagNumber(4)
  $core.String get nameCountry => $_getSZ(2);
  @$pb.TagNumber(4)
  set nameCountry($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(4)
  $core.bool hasNameCountry() => $_has(2);
  @$pb.TagNumber(4)
  void clearNameCountry() => clearField(4);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
