//
//  Generated code. Do not modify.
//  source: service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use imageAndDatasetDescriptor instead')
const ImageAndDataset$json = {
  '1': 'ImageAndDataset',
  '2': [
    {'1': 'image', '3': 1, '4': 1, '5': 11, '6': '.ImageData', '10': 'image'},
    {'1': 'dataset', '3': 2, '4': 1, '5': 11, '6': '.Dataset', '10': 'dataset'},
  ],
};

/// Descriptor for `ImageAndDataset`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List imageAndDatasetDescriptor = $convert.base64Decode(
    'Cg9JbWFnZUFuZERhdGFzZXQSIAoFaW1hZ2UYASABKAsyCi5JbWFnZURhdGFSBWltYWdlEiIKB2'
    'RhdGFzZXQYAiABKAsyCC5EYXRhc2V0UgdkYXRhc2V0');

@$core.Deprecated('Use bytesImageDescriptor instead')
const BytesImage$json = {
  '1': 'BytesImage',
  '2': [
    {'1': 'bytes', '3': 1, '4': 3, '5': 13, '10': 'bytes'},
    {'1': 'height', '3': 2, '4': 1, '5': 5, '10': 'height'},
    {'1': 'width', '3': 3, '4': 1, '5': 5, '10': 'width'},
  ],
};

/// Descriptor for `BytesImage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List bytesImageDescriptor = $convert.base64Decode(
    'CgpCeXRlc0ltYWdlEhQKBWJ5dGVzGAEgAygNUgVieXRlcxIWCgZoZWlnaHQYAiABKAVSBmhlaW'
    'dodBIUCgV3aWR0aBgDIAEoBVIFd2lkdGg=');

@$core.Deprecated('Use imageDataDescriptor instead')
const ImageData$json = {
  '1': 'ImageData',
  '2': [
    {'1': 'data', '3': 1, '4': 3, '5': 2, '10': 'data'},
  ],
};

/// Descriptor for `ImageData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List imageDataDescriptor = $convert.base64Decode(
    'CglJbWFnZURhdGESEgoEZGF0YRgBIAMoAlIEZGF0YQ==');

@$core.Deprecated('Use datasetDescriptor instead')
const Dataset$json = {
  '1': 'Dataset',
  '2': [
    {'1': 'images', '3': 1, '4': 3, '5': 11, '6': '.ImageData', '10': 'images'},
    {'1': 'owners', '3': 2, '4': 3, '5': 9, '10': 'owners'},
  ],
};

/// Descriptor for `Dataset`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List datasetDescriptor = $convert.base64Decode(
    'CgdEYXRhc2V0EiIKBmltYWdlcxgBIAMoCzIKLkltYWdlRGF0YVIGaW1hZ2VzEhYKBm93bmVycx'
    'gCIAMoCVIGb3duZXJz');

@$core.Deprecated('Use imageOwnerDescriptor instead')
const ImageOwner$json = {
  '1': 'ImageOwner',
  '2': [
    {'1': 'is_in_database', '3': 1, '4': 1, '5': 8, '10': 'isInDatabase'},
    {'1': 'owner', '3': 2, '4': 1, '5': 9, '10': 'owner'},
  ],
};

/// Descriptor for `ImageOwner`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List imageOwnerDescriptor = $convert.base64Decode(
    'CgpJbWFnZU93bmVyEiQKDmlzX2luX2RhdGFiYXNlGAEgASgIUgxpc0luRGF0YWJhc2USFAoFb3'
    'duZXIYAiABKAlSBW93bmVy');

