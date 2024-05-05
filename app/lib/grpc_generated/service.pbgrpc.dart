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
  static final _$getImageData = $grpc.ClientMethod<$0.BytesImage, $0.ImageData>(
      '/ImageProcessingService/GetImageData',
      ($0.BytesImage value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ImageData.fromBuffer(value));
  static final _$getImageOwner = $grpc.ClientMethod<$0.ImageAndDataset, $0.ImageOwner>(
      '/ImageProcessingService/GetImageOwner',
      ($0.ImageAndDataset value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ImageOwner.fromBuffer(value));

  ImageProcessingServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.ImageData> getImageData($0.BytesImage request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getImageData, request, options: options);
  }

  $grpc.ResponseFuture<$0.ImageOwner> getImageOwner($0.ImageAndDataset request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getImageOwner, request, options: options);
  }
}

@$pb.GrpcServiceName('ImageProcessingService')
abstract class ImageProcessingServiceBase extends $grpc.Service {
  $core.String get $name => 'ImageProcessingService';

  ImageProcessingServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.BytesImage, $0.ImageData>(
        'GetImageData',
        getImageData_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.BytesImage.fromBuffer(value),
        ($0.ImageData value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ImageAndDataset, $0.ImageOwner>(
        'GetImageOwner',
        getImageOwner_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ImageAndDataset.fromBuffer(value),
        ($0.ImageOwner value) => value.writeToBuffer()));
  }

  $async.Future<$0.ImageData> getImageData_Pre($grpc.ServiceCall call, $async.Future<$0.BytesImage> request) async {
    return getImageData(call, await request);
  }

  $async.Future<$0.ImageOwner> getImageOwner_Pre($grpc.ServiceCall call, $async.Future<$0.ImageAndDataset> request) async {
    return getImageOwner(call, await request);
  }

  $async.Future<$0.ImageData> getImageData($grpc.ServiceCall call, $0.BytesImage request);
  $async.Future<$0.ImageOwner> getImageOwner($grpc.ServiceCall call, $0.ImageAndDataset request);
}
