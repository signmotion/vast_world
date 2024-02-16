//
//  Generated code. Do not modify.
//  source: vw/runes/fantasy_journey_conceiver/services/place.proto
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
import '../../../share/responses/image.pb.dart' as $2;
import 'place.pb.dart' as $1;

export 'place.pb.dart';

@$pb.GrpcServiceName('vw.runes.fantasy_journey_conceiver.PlaceService')
class PlaceServiceClient extends $grpc.Client {
  static final _$conceiveNameAndId = $grpc.ClientMethod<$0.PromptRequest, $1.ConceiveNameAndIdPlaceResponse>(
      '/vw.runes.fantasy_journey_conceiver.PlaceService/conceiveNameAndId',
      ($0.PromptRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.ConceiveNameAndIdPlaceResponse.fromBuffer(value));
  static final _$conceiveImage = $grpc.ClientMethod<$0.PromptRequest, $2.ImageResponse>(
      '/vw.runes.fantasy_journey_conceiver.PlaceService/conceiveImage',
      ($0.PromptRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.ImageResponse.fromBuffer(value));

  PlaceServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$1.ConceiveNameAndIdPlaceResponse> conceiveNameAndId($0.PromptRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$conceiveNameAndId, request, options: options);
  }

  $grpc.ResponseFuture<$2.ImageResponse> conceiveImage($0.PromptRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$conceiveImage, request, options: options);
  }
}

@$pb.GrpcServiceName('vw.runes.fantasy_journey_conceiver.PlaceService')
abstract class PlaceServiceBase extends $grpc.Service {
  $core.String get $name => 'vw.runes.fantasy_journey_conceiver.PlaceService';

  PlaceServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.PromptRequest, $1.ConceiveNameAndIdPlaceResponse>(
        'conceiveNameAndId',
        conceiveNameAndId_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.PromptRequest.fromBuffer(value),
        ($1.ConceiveNameAndIdPlaceResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.PromptRequest, $2.ImageResponse>(
        'conceiveImage',
        conceiveImage_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.PromptRequest.fromBuffer(value),
        ($2.ImageResponse value) => value.writeToBuffer()));
  }

  $async.Future<$1.ConceiveNameAndIdPlaceResponse> conceiveNameAndId_Pre($grpc.ServiceCall call, $async.Future<$0.PromptRequest> request) async {
    return conceiveNameAndId(call, await request);
  }

  $async.Future<$2.ImageResponse> conceiveImage_Pre($grpc.ServiceCall call, $async.Future<$0.PromptRequest> request) async {
    return conceiveImage(call, await request);
  }

  $async.Future<$1.ConceiveNameAndIdPlaceResponse> conceiveNameAndId($grpc.ServiceCall call, $0.PromptRequest request);
  $async.Future<$2.ImageResponse> conceiveImage($grpc.ServiceCall call, $0.PromptRequest request);
}
