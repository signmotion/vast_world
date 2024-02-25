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
  static final _$hasPlan = $grpc.ClientMethod<$0.HasPlanRequest, $0.HasPlanResponse>(
      '/vw.maia.Service/hasPlan',
      ($0.HasPlanRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.HasPlanResponse.fromBuffer(value));
  static final _$constructPlan = $grpc.ClientMethod<$0.ConstructPlanRequest, $0.ConstructPlanResponse>(
      '/vw.maia.Service/constructPlan',
      ($0.ConstructPlanRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ConstructPlanResponse.fromBuffer(value));
  static final _$fetchPlan = $grpc.ClientMethod<$0.FetchPlanRequest, $0.FetchPlanResponse>(
      '/vw.maia.Service/fetchPlan',
      ($0.FetchPlanRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.FetchPlanResponse.fromBuffer(value));
  static final _$fetchPlanIds = $grpc.ClientMethod<$0.FetchPlanIdsRequest, $0.FetchPlanIdsResponse>(
      '/vw.maia.Service/fetchPlanIds',
      ($0.FetchPlanIdsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.FetchPlanIdsResponse.fromBuffer(value));
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

  $grpc.ResponseFuture<$0.HasPlanResponse> hasPlan($0.HasPlanRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$hasPlan, request, options: options);
  }

  $grpc.ResponseFuture<$0.ConstructPlanResponse> constructPlan($0.ConstructPlanRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$constructPlan, request, options: options);
  }

  $grpc.ResponseFuture<$0.FetchPlanResponse> fetchPlan($0.FetchPlanRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$fetchPlan, request, options: options);
  }

  $grpc.ResponseFuture<$0.FetchPlanIdsResponse> fetchPlanIds($0.FetchPlanIdsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$fetchPlanIds, request, options: options);
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
    $addMethod($grpc.ServiceMethod<$0.HasPlanRequest, $0.HasPlanResponse>(
        'hasPlan',
        hasPlan_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.HasPlanRequest.fromBuffer(value),
        ($0.HasPlanResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ConstructPlanRequest, $0.ConstructPlanResponse>(
        'constructPlan',
        constructPlan_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ConstructPlanRequest.fromBuffer(value),
        ($0.ConstructPlanResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FetchPlanRequest, $0.FetchPlanResponse>(
        'fetchPlan',
        fetchPlan_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.FetchPlanRequest.fromBuffer(value),
        ($0.FetchPlanResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FetchPlanIdsRequest, $0.FetchPlanIdsResponse>(
        'fetchPlanIds',
        fetchPlanIds_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.FetchPlanIdsRequest.fromBuffer(value),
        ($0.FetchPlanIdsResponse value) => value.writeToBuffer()));
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

  $async.Future<$0.HasPlanResponse> hasPlan_Pre($grpc.ServiceCall call, $async.Future<$0.HasPlanRequest> request) async {
    return hasPlan(call, await request);
  }

  $async.Future<$0.ConstructPlanResponse> constructPlan_Pre($grpc.ServiceCall call, $async.Future<$0.ConstructPlanRequest> request) async {
    return constructPlan(call, await request);
  }

  $async.Future<$0.FetchPlanResponse> fetchPlan_Pre($grpc.ServiceCall call, $async.Future<$0.FetchPlanRequest> request) async {
    return fetchPlan(call, await request);
  }

  $async.Future<$0.FetchPlanIdsResponse> fetchPlanIds_Pre($grpc.ServiceCall call, $async.Future<$0.FetchPlanIdsRequest> request) async {
    return fetchPlanIds(call, await request);
  }

  $async.Future<$0.SetCurrentPlanResponse> setCurrentPlan_Pre($grpc.ServiceCall call, $async.Future<$0.SetCurrentPlanRequest> request) async {
    return setCurrentPlan(call, await request);
  }

  $async.Future<$0.ClaimSessionResponse> claimSession($grpc.ServiceCall call, $0.ClaimSessionRequest request);
  $async.Future<$0.ApproveSessionResponse> approveSession($grpc.ServiceCall call, $0.ApproveSessionRequest request);
  $async.Future<$0.GetAboutServerResponse> getAboutServer($grpc.ServiceCall call, $0.GetAboutServerRequest request);
  $async.Future<$0.HasPlanResponse> hasPlan($grpc.ServiceCall call, $0.HasPlanRequest request);
  $async.Future<$0.ConstructPlanResponse> constructPlan($grpc.ServiceCall call, $0.ConstructPlanRequest request);
  $async.Future<$0.FetchPlanResponse> fetchPlan($grpc.ServiceCall call, $0.FetchPlanRequest request);
  $async.Future<$0.FetchPlanIdsResponse> fetchPlanIds($grpc.ServiceCall call, $0.FetchPlanIdsRequest request);
  $async.Future<$0.SetCurrentPlanResponse> setCurrentPlan($grpc.ServiceCall call, $0.SetCurrentPlanRequest request);
  $async.Stream<$0.ActBaseResponse> synchronize($grpc.ServiceCall call, $async.Stream<$0.ActBaseRequest> request);
}
