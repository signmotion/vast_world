//
//  Generated code. Do not modify.
//  source: vw/share/lore.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'plan.pb.dart' as $2;

class LoreBase extends $pb.GeneratedMessage {
  factory LoreBase({
    $core.Map<$core.String, $2.PlanBase>? plans,
  }) {
    final $result = create();
    if (plans != null) {
      $result.plans.addAll(plans);
    }
    return $result;
  }
  LoreBase._() : super();
  factory LoreBase.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LoreBase.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LoreBase', package: const $pb.PackageName(_omitMessageNames ? '' : 'vw.share'), createEmptyInstance: create)
    ..m<$core.String, $2.PlanBase>(10, _omitFieldNames ? '' : 'plans', entryClassName: 'LoreBase.PlansEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OM, valueCreator: $2.PlanBase.create, valueDefaultOrMaker: $2.PlanBase.getDefault, packageName: const $pb.PackageName('vw.share'))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LoreBase clone() => LoreBase()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LoreBase copyWith(void Function(LoreBase) updates) => super.copyWith((message) => updates(message as LoreBase)) as LoreBase;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LoreBase create() => LoreBase._();
  LoreBase createEmptyInstance() => create();
  static $pb.PbList<LoreBase> createRepeated() => $pb.PbList<LoreBase>();
  @$core.pragma('dart2js:noInline')
  static LoreBase getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LoreBase>(create);
  static LoreBase? _defaultInstance;

  /// / <plan_id, PlanBase>
  @$pb.TagNumber(10)
  $core.Map<$core.String, $2.PlanBase> get plans => $_getMap(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
