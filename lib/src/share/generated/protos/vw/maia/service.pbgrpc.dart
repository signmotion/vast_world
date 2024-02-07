//
//  Generated code. Do not modify.
//  source: vw/maia/service.proto
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

@$pb.GrpcServiceName('vw.maia.Service')
class ServiceClient extends $grpc.Client {
  static final _$claimSession = $grpc.ClientMethod<$0.ClaimSessionRequest, $0.ClaimSessionResponse>(
      '/vw.maia.Service/claimSession',
      ($0.ClaimSessionRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ClaimSessionResponse.fromBuffer(value));
  static final _$approveSession = $grpc.ClientMethod<$0.ApproveSessionRequest, $0.ApproveSessionResponse>(
      '/vw.maia.Service/approveSession',
      ($0.ApproveSessionRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ApproveSessionResponse.fromBuffer(value));
  static final _$getAboutServer = $grpc.ClientMethod<$0.GetAboutServerRequest, $0.GetAboutServerResponse>(
      '/vw.maia.Service/getAboutServer',
      ($0.GetAboutServerRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetAboutServerResponse.fromBuffer(value));
  static final _$setCurrentPlan = $grpc.ClientMethod<$0.SetCurrentPlanRequest, $0.SetCurrentPlanResponse>(
      '/vw.maia.Service/setCurrentPlan',
      ($0.SetCurrentPlanRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.SetCurrentPlanResponse.fromBuffer(value));
  static final _$synchronize = $grpc.ClientMethod<$0.ActBaseRequest, $0.ActBaseResponse>(
      '/vw.maia.Service/synchronize',
      ($0.ActBaseRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ActBaseResponse.fromBuffer(value));

  ServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.ClaimSessionResponse> claimSession($0.ClaimSessionRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$claimSession, request, options: options);
  }

  $grpc.ResponseFuture<$0.ApproveSessionResponse> approveSession($0.ApproveSessionRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$approveSession, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetAboutServerResponse> getAboutServer($0.GetAboutServerRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getAboutServer, request, options: options);
  }

  $grpc.ResponseFuture<$0.SetCurrentPlanResponse> setCurrentPlan($0.SetCurrentPlanRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$setCurrentPlan, request, options: options);
  }

  $grpc.ResponseStream<$0.ActBaseResponse> synchronize($async.Stream<$0.ActBaseRequest> request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$synchronize, request, options: options);
  }
}

@$pb.GrpcServiceName('vw.maia.Service')
abstract class ServiceBase extends $grpc.Service {
  $core.String get $name => 'vw.maia.Service';

  ServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.ClaimSessionRequest, $0.ClaimSessionResponse>(
        'claimSession',
        claimSession_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ClaimSessionRequest.fromBuffer(value),
        ($0.ClaimSessionResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ApproveSessionRequest, $0.ApproveSessionResponse>(
        'approveSession',
        approveSession_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ApproveSessionRequest.fromBuffer(value),
        ($0.ApproveSessionResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetAboutServerRequest, $0.GetAboutServerResponse>(
        'getAboutServer',
        getAboutServer_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetAboutServerRequest.fromBuffer(value),
        ($0.GetAboutServerResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SetCurrentPlanRequest, $0.SetCurrentPlanResponse>(
        'setCurrentPlan',
        setCurrentPlan_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SetCurrentPlanRequest.fromBuffer(value),
        ($0.SetCurrentPlanResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ActBaseRequest, $0.ActBaseResponse>(
        'synchronize',
        synchronize,
        true,
        true,
        ($core.List<$core.int> value) => $0.ActBaseRequest.fromBuffer(value),
        ($0.ActBaseResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.ClaimSessionResponse> claimSession_Pre($grpc.ServiceCall call, $async.Future<$0.ClaimSessionRequest> request) async {
    return claimSession(call, await request);
  }

  $async.Future<$0.ApproveSessionResponse> approveSession_Pre($grpc.ServiceCall call, $async.Future<$0.ApproveSessionRequest> request) async {
    return approveSession(call, await request);
  }

  $async.Future<$0.GetAboutServerResponse> getAboutServer_Pre($grpc.ServiceCall call, $async.Future<$0.GetAboutServerRequest> request) async {
    return getAboutServer(call, await request);
  }

  $async.Future<$0.SetCurrentPlanResponse> setCurrentPlan_Pre($grpc.ServiceCall call, $async.Future<$0.SetCurrentPlanRequest> request) async {
    return setCurrentPlan(call, await request);
  }

  $async.Future<$0.ClaimSessionResponse> claimSession($grpc.ServiceCall call, $0.ClaimSessionRequest request);
  $async.Future<$0.ApproveSessionResponse> approveSession($grpc.ServiceCall call, $0.ApproveSessionRequest request);
  $async.Future<$0.GetAboutServerResponse> getAboutServer($grpc.ServiceCall call, $0.GetAboutServerRequest request);
  $async.Future<$0.SetCurrentPlanResponse> setCurrentPlan($grpc.ServiceCall call, $0.SetCurrentPlanRequest request);
  $async.Stream<$0.ActBaseResponse> synchronize($grpc.ServiceCall call, $async.Stream<$0.ActBaseRequest> request);
}
