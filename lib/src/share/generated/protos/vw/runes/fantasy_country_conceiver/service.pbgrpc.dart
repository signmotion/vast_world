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

import '../../share/requests/prompt.pb.dart' as $0;
import '../../share/responses/image.pb.dart' as $2;
import 'service.pb.dart' as $1;

export 'service.pb.dart';

@$pb.GrpcServiceName('vw.runes.fantasy_country_conceiver.Service')
class ServiceClient extends $grpc.Client {
  static final _$conceivingNameAndIdJourney = $grpc.ClientMethod<$0.PromptRequest, $1.ConceivingNameAndIdJourneyResponse>(
      '/vw.runes.fantasy_country_conceiver.Service/conceivingNameAndIdJourney',
      ($0.PromptRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.ConceivingNameAndIdJourneyResponse.fromBuffer(value));
  static final _$conceivingNameAndIdPlace = $grpc.ClientMethod<$0.PromptRequest, $1.ConceivingNameAndIdPlaceResponse>(
      '/vw.runes.fantasy_country_conceiver.Service/conceivingNameAndIdPlace',
      ($0.PromptRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.ConceivingNameAndIdPlaceResponse.fromBuffer(value));
  static final _$conceivingImagePlace = $grpc.ClientMethod<$0.PromptRequest, $2.ImageResponse>(
      '/vw.runes.fantasy_country_conceiver.Service/conceivingImagePlace',
      ($0.PromptRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.ImageResponse.fromBuffer(value));

  ServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$1.ConceivingNameAndIdJourneyResponse> conceivingNameAndIdJourney($0.PromptRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$conceivingNameAndIdJourney, request, options: options);
  }

  $grpc.ResponseFuture<$1.ConceivingNameAndIdPlaceResponse> conceivingNameAndIdPlace($0.PromptRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$conceivingNameAndIdPlace, request, options: options);
  }

  $grpc.ResponseFuture<$2.ImageResponse> conceivingImagePlace($0.PromptRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$conceivingImagePlace, request, options: options);
  }
}

@$pb.GrpcServiceName('vw.runes.fantasy_country_conceiver.Service')
abstract class ServiceBase extends $grpc.Service {
  $core.String get $name => 'vw.runes.fantasy_country_conceiver.Service';

  ServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.PromptRequest, $1.ConceivingNameAndIdJourneyResponse>(
        'conceivingNameAndIdJourney',
        conceivingNameAndIdJourney_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.PromptRequest.fromBuffer(value),
        ($1.ConceivingNameAndIdJourneyResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.PromptRequest, $1.ConceivingNameAndIdPlaceResponse>(
        'conceivingNameAndIdPlace',
        conceivingNameAndIdPlace_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.PromptRequest.fromBuffer(value),
        ($1.ConceivingNameAndIdPlaceResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.PromptRequest, $2.ImageResponse>(
        'conceivingImagePlace',
        conceivingImagePlace_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.PromptRequest.fromBuffer(value),
        ($2.ImageResponse value) => value.writeToBuffer()));
  }

  $async.Future<$1.ConceivingNameAndIdJourneyResponse> conceivingNameAndIdJourney_Pre($grpc.ServiceCall call, $async.Future<$0.PromptRequest> request) async {
    return conceivingNameAndIdJourney(call, await request);
  }

  $async.Future<$1.ConceivingNameAndIdPlaceResponse> conceivingNameAndIdPlace_Pre($grpc.ServiceCall call, $async.Future<$0.PromptRequest> request) async {
    return conceivingNameAndIdPlace(call, await request);
  }

  $async.Future<$2.ImageResponse> conceivingImagePlace_Pre($grpc.ServiceCall call, $async.Future<$0.PromptRequest> request) async {
    return conceivingImagePlace(call, await request);
  }

  $async.Future<$1.ConceivingNameAndIdJourneyResponse> conceivingNameAndIdJourney($grpc.ServiceCall call, $0.PromptRequest request);
  $async.Future<$1.ConceivingNameAndIdPlaceResponse> conceivingNameAndIdPlace($grpc.ServiceCall call, $0.PromptRequest request);
  $async.Future<$2.ImageResponse> conceivingImagePlace($grpc.ServiceCall call, $0.PromptRequest request);
}
