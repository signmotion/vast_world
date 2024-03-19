//
//  Generated code. Do not modify.
//  source: vw/runes/fantasy_conceiver/services/place.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../../syrokomskyi/type/image.pb.dart' as $7;
import '../../../share/server_answer.pb.dart' as $5;
import '../name_and_id_place.pb.dart' as $8;

class ConceiveImagePlaceResponse extends $pb.GeneratedMessage {
  factory ConceiveImagePlaceResponse({
    $7.Image? image,
    $5.ServerAnswer? answer,
  }) {
    final $result = create();
    if (image != null) {
      $result.image = image;
    }
    if (answer != null) {
      $result.answer = answer;
    }
    return $result;
  }
  ConceiveImagePlaceResponse._() : super();
  factory ConceiveImagePlaceResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConceiveImagePlaceResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ConceiveImagePlaceResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'vw.runes.fantasy_conceiver'), createEmptyInstance: create)
    ..aOM<$7.Image>(1, _omitFieldNames ? '' : 'image', subBuilder: $7.Image.create)
    ..aOM<$5.ServerAnswer>(100, _omitFieldNames ? '' : 'answer', subBuilder: $5.ServerAnswer.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ConceiveImagePlaceResponse clone() => ConceiveImagePlaceResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ConceiveImagePlaceResponse copyWith(void Function(ConceiveImagePlaceResponse) updates) => super.copyWith((message) => updates(message as ConceiveImagePlaceResponse)) as ConceiveImagePlaceResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConceiveImagePlaceResponse create() => ConceiveImagePlaceResponse._();
  ConceiveImagePlaceResponse createEmptyInstance() => create();
  static $pb.PbList<ConceiveImagePlaceResponse> createRepeated() => $pb.PbList<ConceiveImagePlaceResponse>();
  @$core.pragma('dart2js:noInline')
  static ConceiveImagePlaceResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ConceiveImagePlaceResponse>(create);
  static ConceiveImagePlaceResponse? _defaultInstance;

  /// / PNG-encoded image.
  @$pb.TagNumber(1)
  $7.Image get image => $_getN(0);
  @$pb.TagNumber(1)
  set image($7.Image v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasImage() => $_has(0);
  @$pb.TagNumber(1)
  void clearImage() => clearField(1);
  @$pb.TagNumber(1)
  $7.Image ensureImage() => $_ensure(0);

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

class ConceiveNameAndIdPlaceResponse extends $pb.GeneratedMessage {
  factory ConceiveNameAndIdPlaceResponse({
    $8.NameAndIdPlaceBase? data,
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
  ConceiveNameAndIdPlaceResponse._() : super();
  factory ConceiveNameAndIdPlaceResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConceiveNameAndIdPlaceResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ConceiveNameAndIdPlaceResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'vw.runes.fantasy_conceiver'), createEmptyInstance: create)
    ..aOM<$8.NameAndIdPlaceBase>(1, _omitFieldNames ? '' : 'data', subBuilder: $8.NameAndIdPlaceBase.create)
    ..aOM<$5.ServerAnswer>(100, _omitFieldNames ? '' : 'answer', subBuilder: $5.ServerAnswer.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ConceiveNameAndIdPlaceResponse clone() => ConceiveNameAndIdPlaceResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ConceiveNameAndIdPlaceResponse copyWith(void Function(ConceiveNameAndIdPlaceResponse) updates) => super.copyWith((message) => updates(message as ConceiveNameAndIdPlaceResponse)) as ConceiveNameAndIdPlaceResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConceiveNameAndIdPlaceResponse create() => ConceiveNameAndIdPlaceResponse._();
  ConceiveNameAndIdPlaceResponse createEmptyInstance() => create();
  static $pb.PbList<ConceiveNameAndIdPlaceResponse> createRepeated() => $pb.PbList<ConceiveNameAndIdPlaceResponse>();
  @$core.pragma('dart2js:noInline')
  static ConceiveNameAndIdPlaceResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ConceiveNameAndIdPlaceResponse>(create);
  static ConceiveNameAndIdPlaceResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $8.NameAndIdPlaceBase get data => $_getN(0);
  @$pb.TagNumber(1)
  set data($8.NameAndIdPlaceBase v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasData() => $_has(0);
  @$pb.TagNumber(1)
  void clearData() => clearField(1);
  @$pb.TagNumber(1)
  $8.NameAndIdPlaceBase ensureData() => $_ensure(0);

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
