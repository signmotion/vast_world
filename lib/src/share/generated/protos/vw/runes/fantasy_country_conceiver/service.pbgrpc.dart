//
//  Generated code. Do not modify.
//  source: vw/runes/fantasy_country_conceiver/service.proto
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

import 'service.pb.dart' as $0;

export 'service.pb.dart';

@$pb.GrpcServiceName('vw.runes.fantasy_country_conceiver.Service')
class ServiceClient extends $grpc.Client {
  static final _$conceivingDescriptionCountry = $grpc.ClientMethod<$0.PromptRequest, $0.TextResponse>(
      '/vw.runes.fantasy_country_conceiver.Service/conceivingDescriptionCountry',
      ($0.PromptRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.TextResponse.fromBuffer(value));
  static final _$conceivingImageFirstPlaceCountry = $grpc.ClientMethod<$0.PromptRequest, $0.ImageResponse>(
      '/vw.runes.fantasy_country_conceiver.Service/conceivingImageFirstPlaceCountry',
      ($0.PromptRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ImageResponse.fromBuffer(value));
  static final _$conceivingNameCountry = $grpc.ClientMethod<$0.PromptRequest, $0.JsonResponse>(
      '/vw.runes.fantasy_country_conceiver.Service/conceivingNameCountry',
      ($0.PromptRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.JsonResponse.fromBuffer(value));

  ServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.TextResponse> conceivingDescriptionCountry($0.PromptRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$conceivingDescriptionCountry, request, options: options);
  }

  $grpc.ResponseFuture<$0.ImageResponse> conceivingImageFirstPlaceCountry($0.PromptRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$conceivingImageFirstPlaceCountry, request, options: options);
  }

  $grpc.ResponseFuture<$0.JsonResponse> conceivingNameCountry($0.PromptRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$conceivingNameCountry, request, options: options);
  }
}

@$pb.GrpcServiceName('vw.runes.fantasy_country_conceiver.Service')
abstract class ServiceBase extends $grpc.Service {
  $core.String get $name => 'vw.runes.fantasy_country_conceiver.Service';

  ServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.PromptRequest, $0.TextResponse>(
        'conceivingDescriptionCountry',
        conceivingDescriptionCountry_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.PromptRequest.fromBuffer(value),
        ($0.TextResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.PromptRequest, $0.ImageResponse>(
        'conceivingImageFirstPlaceCountry',
        conceivingImageFirstPlaceCountry_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.PromptRequest.fromBuffer(value),
        ($0.ImageResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.PromptRequest, $0.JsonResponse>(
        'conceivingNameCountry',
        conceivingNameCountry_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.PromptRequest.fromBuffer(value),
        ($0.JsonResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.TextResponse> conceivingDescriptionCountry_Pre($grpc.ServiceCall call, $async.Future<$0.PromptRequest> request) async {
    return conceivingDescriptionCountry(call, await request);
  }

  $async.Future<$0.ImageResponse> conceivingImageFirstPlaceCountry_Pre($grpc.ServiceCall call, $async.Future<$0.PromptRequest> request) async {
    return conceivingImageFirstPlaceCountry(call, await request);
  }

  $async.Future<$0.JsonResponse> conceivingNameCountry_Pre($grpc.ServiceCall call, $async.Future<$0.PromptRequest> request) async {
    return conceivingNameCountry(call, await request);
  }

  $async.Future<$0.TextResponse> conceivingDescriptionCountry($grpc.ServiceCall call, $0.PromptRequest request);
  $async.Future<$0.ImageResponse> conceivingImageFirstPlaceCountry($grpc.ServiceCall call, $0.PromptRequest request);
  $async.Future<$0.JsonResponse> conceivingNameCountry($grpc.ServiceCall call, $0.PromptRequest request);
}
