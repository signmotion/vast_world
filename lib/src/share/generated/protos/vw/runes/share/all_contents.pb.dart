//
//  Generated code. Do not modify.
//  source: vw/runes/share/all_contents.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'one_content.pb.dart' as $0;

class AllContentsBase extends $pb.GeneratedMessage {
  factory AllContentsBase({
    $core.Map<$core.String, $0.OneContentBase>? states,
  }) {
    final $result = create();
    if (states != null) {
      $result.states.addAll(states);
    }
    return $result;
  }
  AllContentsBase._() : super();
  factory AllContentsBase.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AllContentsBase.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AllContentsBase', package: const $pb.PackageName(_omitMessageNames ? '' : 'vw.runes.share'), createEmptyInstance: create)
    ..m<$core.String, $0.OneContentBase>(1, _omitFieldNames ? '' : 'states', entryClassName: 'AllContentsBase.StatesEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OM, valueCreator: $0.OneContentBase.create, valueDefaultOrMaker: $0.OneContentBase.getDefault, packageName: const $pb.PackageName('vw.runes.share'))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AllContentsBase clone() => AllContentsBase()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AllContentsBase copyWith(void Function(AllContentsBase) updates) => super.copyWith((message) => updates(message as AllContentsBase)) as AllContentsBase;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AllContentsBase create() => AllContentsBase._();
  AllContentsBase createEmptyInstance() => create();
  static $pb.PbList<AllContentsBase> createRepeated() => $pb.PbList<AllContentsBase>();
  @$core.pragma('dart2js:noInline')
  static AllContentsBase getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AllContentsBase>(create);
  static AllContentsBase? _defaultInstance;

  /// / Values of all runes.
  /// / <runeId, OneContentBase>
  @$pb.TagNumber(1)
  $core.Map<$core.String, $0.OneContentBase> get states => $_getMap(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
