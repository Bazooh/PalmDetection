//
//  Generated code. Do not modify.
//  source: service.proto
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

@$pb.GrpcServiceName('ImageProcessingService')
class ImageProcessingServiceClient extends $grpc.Client {
  static final _$addImageToDatabase = $grpc.ClientMethod<$0.ImageAndOwner, $0.Empty>(
      '/ImageProcessingService/AddImageToDatabase',
      ($0.ImageAndOwner value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$getImageOwner = $grpc.ClientMethod<$0.BytesImage, $0.ImageOwner>(
      '/ImageProcessingService/GetImageOwner',
      ($0.BytesImage value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ImageOwner.fromBuffer(value));
  static final _$isImageOwnedByOwner = $grpc.ClientMethod<$0.ImageAndOwner, $0.Confidence>(
      '/ImageProcessingService/IsImageOwnedByOwner',
      ($0.ImageAndOwner value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Confidence.fromBuffer(value));
  static final _$getHandOwners = $grpc.ClientMethod<$0.Empty, $0.HandOwners>(
      '/ImageProcessingService/GetHandOwners',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.HandOwners.fromBuffer(value));

  ImageProcessingServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.Empty> addImageToDatabase($0.ImageAndOwner request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$addImageToDatabase, request, options: options);
  }

  $grpc.ResponseFuture<$0.ImageOwner> getImageOwner($0.BytesImage request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getImageOwner, request, options: options);
  }

  $grpc.ResponseFuture<$0.Confidence> isImageOwnedByOwner($0.ImageAndOwner request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$isImageOwnedByOwner, request, options: options);
  }

  $grpc.ResponseFuture<$0.HandOwners> getHandOwners($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getHandOwners, request, options: options);
  }
}

@$pb.GrpcServiceName('ImageProcessingService')
abstract class ImageProcessingServiceBase extends $grpc.Service {
  $core.String get $name => 'ImageProcessingService';

  ImageProcessingServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.ImageAndOwner, $0.Empty>(
        'AddImageToDatabase',
        addImageToDatabase_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ImageAndOwner.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.BytesImage, $0.ImageOwner>(
        'GetImageOwner',
        getImageOwner_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.BytesImage.fromBuffer(value),
        ($0.ImageOwner value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ImageAndOwner, $0.Confidence>(
        'IsImageOwnedByOwner',
        isImageOwnedByOwner_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ImageAndOwner.fromBuffer(value),
        ($0.Confidence value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.HandOwners>(
        'GetHandOwners',
        getHandOwners_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.HandOwners value) => value.writeToBuffer()));
  }

  $async.Future<$0.Empty> addImageToDatabase_Pre($grpc.ServiceCall call, $async.Future<$0.ImageAndOwner> request) async {
    return addImageToDatabase(call, await request);
  }

  $async.Future<$0.ImageOwner> getImageOwner_Pre($grpc.ServiceCall call, $async.Future<$0.BytesImage> request) async {
    return getImageOwner(call, await request);
  }

  $async.Future<$0.Confidence> isImageOwnedByOwner_Pre($grpc.ServiceCall call, $async.Future<$0.ImageAndOwner> request) async {
    return isImageOwnedByOwner(call, await request);
  }

  $async.Future<$0.HandOwners> getHandOwners_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return getHandOwners(call, await request);
  }

  $async.Future<$0.Empty> addImageToDatabase($grpc.ServiceCall call, $0.ImageAndOwner request);
  $async.Future<$0.ImageOwner> getImageOwner($grpc.ServiceCall call, $0.BytesImage request);
  $async.Future<$0.Confidence> isImageOwnedByOwner($grpc.ServiceCall call, $0.ImageAndOwner request);
  $async.Future<$0.HandOwners> getHandOwners($grpc.ServiceCall call, $0.Empty request);
}
