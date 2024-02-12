//
//  Generated code. Do not modify.
//  source: vw/runes/share/one_content.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class OneContentBase extends $pb.GeneratedMessage {
  factory OneContentBase({
    $core.Map<$core.String, $core.String>? sjsonValues,
  }) {
    final $result = create();
    if (sjsonValues != null) {
      $result.sjsonValues.addAll(sjsonValues);
    }
    return $result;
  }
  OneContentBase._() : super();
  factory OneContentBase.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory OneContentBase.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'OneContentBase', package: const $pb.PackageName(_omitMessageNames ? '' : 'vw.runes.share'), createEmptyInstance: create)
    ..m<$core.String, $core.String>(1, _omitFieldNames ? '' : 'sjsonValues', entryClassName: 'OneContentBase.SjsonValuesEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('vw.runes.share'))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  OneContentBase clone() => OneContentBase()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  OneContentBase copyWith(void Function(OneContentBase) updates) => super.copyWith((message) => updates(message as OneContentBase)) as OneContentBase;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OneContentBase create() => OneContentBase._();
  OneContentBase createEmptyInstance() => create();
  static $pb.PbList<OneContentBase> createRepeated() => $pb.PbList<OneContentBase>();
  @$core.pragma('dart2js:noInline')
  static OneContentBase getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<OneContentBase>(create);
  static OneContentBase? _defaultInstance;

  /// / Mapped values for the rune.
  /// / To stringify JSON because we have a boilerplate code
  /// / with protobuf map and any-value.
  /// / <key, stringify value>
  @$pb.TagNumber(1)
  $core.Map<$core.String, $core.String> get sjsonValues => $_getMap(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
