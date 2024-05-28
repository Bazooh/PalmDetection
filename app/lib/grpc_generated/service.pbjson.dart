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

@$core.Deprecated('Use imageAndOwnerDescriptor instead')
const ImageAndOwner$json = {
  '1': 'ImageAndOwner',
  '2': [
    {'1': 'image', '3': 1, '4': 1, '5': 11, '6': '.BytesImage', '10': 'image'},
    {'1': 'owner', '3': 2, '4': 1, '5': 9, '10': 'owner'},
  ],
};

/// Descriptor for `ImageAndOwner`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List imageAndOwnerDescriptor = $convert.base64Decode(
    'Cg1JbWFnZUFuZE93bmVyEiEKBWltYWdlGAEgASgLMgsuQnl0ZXNJbWFnZVIFaW1hZ2USFAoFb3'
    'duZXIYAiABKAlSBW93bmVy');

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

@$core.Deprecated('Use confidenceDescriptor instead')
const Confidence$json = {
  '1': 'Confidence',
  '2': [
    {'1': 'result', '3': 1, '4': 1, '5': 8, '10': 'result'},
    {'1': 'probability', '3': 2, '4': 1, '5': 2, '10': 'probability'},
  ],
};

/// Descriptor for `Confidence`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List confidenceDescriptor = $convert.base64Decode(
    'CgpDb25maWRlbmNlEhYKBnJlc3VsdBgBIAEoCFIGcmVzdWx0EiAKC3Byb2JhYmlsaXR5GAIgAS'
    'gCUgtwcm9iYWJpbGl0eQ==');

@$core.Deprecated('Use imageOwnerDescriptor instead')
const ImageOwner$json = {
  '1': 'ImageOwner',
  '2': [
    {'1': 'owner', '3': 1, '4': 1, '5': 9, '10': 'owner'},
    {'1': 'confidence', '3': 2, '4': 1, '5': 11, '6': '.Confidence', '10': 'confidence'},
  ],
};

/// Descriptor for `ImageOwner`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List imageOwnerDescriptor = $convert.base64Decode(
    'CgpJbWFnZU93bmVyEhQKBW93bmVyGAEgASgJUgVvd25lchIrCgpjb25maWRlbmNlGAIgASgLMg'
    'suQ29uZmlkZW5jZVIKY29uZmlkZW5jZQ==');

@$core.Deprecated('Use handOwnersDescriptor instead')
const HandOwners$json = {
  '1': 'HandOwners',
  '2': [
    {'1': 'names', '3': 1, '4': 3, '5': 9, '10': 'names'},
  ],
};

/// Descriptor for `HandOwners`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List handOwnersDescriptor = $convert.base64Decode(
    'CgpIYW5kT3duZXJzEhQKBW5hbWVzGAEgAygJUgVuYW1lcw==');

@$core.Deprecated('Use emptyDescriptor instead')
const Empty$json = {
  '1': 'Empty',
};

/// Descriptor for `Empty`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emptyDescriptor = $convert.base64Decode(
    'CgVFbXB0eQ==');

