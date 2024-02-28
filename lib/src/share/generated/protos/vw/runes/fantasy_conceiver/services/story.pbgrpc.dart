//
//  Generated code. Do not modify.
//  source: vw/runes/fantasy_conceiver/services/story.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import '../../../share/requests/prompt.pb.dart' as $0;
import 'story.pb.dart' as $4;

export 'story.pb.dart';

@$pb.GrpcServiceName('vw.runes.fantasy_conceiver.StoryService')
class StoryServiceClient extends $grpc.Client {
  static final _$conceiveNameAndId = $grpc.ClientMethod<$0.PromptRequest, $4.ConceiveNameAndIdStoryResponse>(
      '/vw.runes.fantasy_conceiver.StoryService/conceiveNameAndId',
      ($0.PromptRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $4.ConceiveNameAndIdStoryResponse.fromBuffer(value));

  StoryServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$4.ConceiveNameAndIdStoryResponse> conceiveNameAndId($0.PromptRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$conceiveNameAndId, request, options: options);
  }
}

@$pb.GrpcServiceName('vw.runes.fantasy_conceiver.StoryService')
abstract class StoryServiceBase extends $grpc.Service {
  $core.String get $name => 'vw.runes.fantasy_conceiver.StoryService';

  StoryServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.PromptRequest, $4.ConceiveNameAndIdStoryResponse>(
        'conceiveNameAndId',
        conceiveNameAndId_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.PromptRequest.fromBuffer(value),
        ($4.ConceiveNameAndIdStoryResponse value) => value.writeToBuffer()));
  }

  $async.Future<$4.ConceiveNameAndIdStoryResponse> conceiveNameAndId_Pre($grpc.ServiceCall call, $async.Future<$0.PromptRequest> request) async {
    return conceiveNameAndId(call, await request);
  }

  $async.Future<$4.ConceiveNameAndIdStoryResponse> conceiveNameAndId($grpc.ServiceCall call, $0.PromptRequest request);
}
