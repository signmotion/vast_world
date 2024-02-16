//
//  Generated code. Do not modify.
//  source: vw/maia/server_options.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// / Options for the Maia.
class ServerOptionsBase extends $pb.GeneratedMessage {
  factory ServerOptionsBase({
    $core.bool? fakeData,
  }) {
    final $result = create();
    if (fakeData != null) {
      $result.fakeData = fakeData;
    }
    return $result;
  }
  ServerOptionsBase._() : super();
  factory ServerOptionsBase.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ServerOptionsBase.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ServerOptionsBase', package: const $pb.PackageName(_omitMessageNames ? '' : 'vw.maia'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'fakeData', protoName: 'fakeData')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ServerOptionsBase clone() => ServerOptionsBase()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ServerOptionsBase copyWith(void Function(ServerOptionsBase) updates) => super.copyWith((message) => updates(message as ServerOptionsBase)) as ServerOptionsBase;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ServerOptionsBase create() => ServerOptionsBase._();
  ServerOptionsBase createEmptyInstance() => create();
  static $pb.PbList<ServerOptionsBase> createRepeated() => $pb.PbList<ServerOptionsBase>();
  @$core.pragma('dart2js:noInline')
  static ServerOptionsBase getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ServerOptionsBase>(create);
  static ServerOptionsBase? _defaultInstance;

  /// / The services can respect this option and generate fake data.
  /// / This is useful for test reason.
  @$pb.TagNumber(1)
  $core.bool get fakeData => $_getBF(0);
  @$pb.TagNumber(1)
  set fakeData($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFakeData() => $_has(0);
  @$pb.TagNumber(1)
  void clearFakeData() => clearField(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
