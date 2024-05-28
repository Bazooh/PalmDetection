//
//  Generated code. Do not modify.
//  source: service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ImageAndOwner extends $pb.GeneratedMessage {
  factory ImageAndOwner({
    BytesImage? image,
    $core.String? owner,
  }) {
    final $result = create();
    if (image != null) {
      $result.image = image;
    }
    if (owner != null) {
      $result.owner = owner;
    }
    return $result;
  }
  ImageAndOwner._() : super();
  factory ImageAndOwner.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ImageAndOwner.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ImageAndOwner', createEmptyInstance: create)
    ..aOM<BytesImage>(1, _omitFieldNames ? '' : 'image', subBuilder: BytesImage.create)
    ..aOS(2, _omitFieldNames ? '' : 'owner')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ImageAndOwner clone() => ImageAndOwner()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ImageAndOwner copyWith(void Function(ImageAndOwner) updates) => super.copyWith((message) => updates(message as ImageAndOwner)) as ImageAndOwner;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ImageAndOwner create() => ImageAndOwner._();
  ImageAndOwner createEmptyInstance() => create();
  static $pb.PbList<ImageAndOwner> createRepeated() => $pb.PbList<ImageAndOwner>();
  @$core.pragma('dart2js:noInline')
  static ImageAndOwner getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ImageAndOwner>(create);
  static ImageAndOwner? _defaultInstance;

  @$pb.TagNumber(1)
  BytesImage get image => $_getN(0);
  @$pb.TagNumber(1)
  set image(BytesImage v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasImage() => $_has(0);
  @$pb.TagNumber(1)
  void clearImage() => clearField(1);
  @$pb.TagNumber(1)
  BytesImage ensureImage() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get owner => $_getSZ(1);
  @$pb.TagNumber(2)
  set owner($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasOwner() => $_has(1);
  @$pb.TagNumber(2)
  void clearOwner() => clearField(2);
}

class BytesImage extends $pb.GeneratedMessage {
  factory BytesImage({
    $core.Iterable<$core.int>? bytes,
    $core.int? height,
    $core.int? width,
  }) {
    final $result = create();
    if (bytes != null) {
      $result.bytes.addAll(bytes);
    }
    if (height != null) {
      $result.height = height;
    }
    if (width != null) {
      $result.width = width;
    }
    return $result;
  }
  BytesImage._() : super();
  factory BytesImage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BytesImage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BytesImage', createEmptyInstance: create)
    ..p<$core.int>(1, _omitFieldNames ? '' : 'bytes', $pb.PbFieldType.KU3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'height', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'width', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BytesImage clone() => BytesImage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BytesImage copyWith(void Function(BytesImage) updates) => super.copyWith((message) => updates(message as BytesImage)) as BytesImage;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BytesImage create() => BytesImage._();
  BytesImage createEmptyInstance() => create();
  static $pb.PbList<BytesImage> createRepeated() => $pb.PbList<BytesImage>();
  @$core.pragma('dart2js:noInline')
  static BytesImage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BytesImage>(create);
  static BytesImage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get bytes => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get height => $_getIZ(1);
  @$pb.TagNumber(2)
  set height($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasHeight() => $_has(1);
  @$pb.TagNumber(2)
  void clearHeight() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get width => $_getIZ(2);
  @$pb.TagNumber(3)
  set width($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasWidth() => $_has(2);
  @$pb.TagNumber(3)
  void clearWidth() => clearField(3);
}

class Confidence extends $pb.GeneratedMessage {
  factory Confidence({
    $core.bool? result,
    $core.double? probability,
  }) {
    final $result = create();
    if (result != null) {
      $result.result = result;
    }
    if (probability != null) {
      $result.probability = probability;
    }
    return $result;
  }
  Confidence._() : super();
  factory Confidence.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Confidence.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Confidence', createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'result')
    ..a<$core.double>(2, _omitFieldNames ? '' : 'probability', $pb.PbFieldType.OF)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Confidence clone() => Confidence()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Confidence copyWith(void Function(Confidence) updates) => super.copyWith((message) => updates(message as Confidence)) as Confidence;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Confidence create() => Confidence._();
  Confidence createEmptyInstance() => create();
  static $pb.PbList<Confidence> createRepeated() => $pb.PbList<Confidence>();
  @$core.pragma('dart2js:noInline')
  static Confidence getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Confidence>(create);
  static Confidence? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get result => $_getBF(0);
  @$pb.TagNumber(1)
  set result($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasResult() => $_has(0);
  @$pb.TagNumber(1)
  void clearResult() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get probability => $_getN(1);
  @$pb.TagNumber(2)
  set probability($core.double v) { $_setFloat(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasProbability() => $_has(1);
  @$pb.TagNumber(2)
  void clearProbability() => clearField(2);
}

class ImageOwner extends $pb.GeneratedMessage {
  factory ImageOwner({
    $core.String? owner,
    Confidence? confidence,
  }) {
    final $result = create();
    if (owner != null) {
      $result.owner = owner;
    }
    if (confidence != null) {
      $result.confidence = confidence;
    }
    return $result;
  }
  ImageOwner._() : super();
  factory ImageOwner.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ImageOwner.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ImageOwner', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'owner')
    ..aOM<Confidence>(2, _omitFieldNames ? '' : 'confidence', subBuilder: Confidence.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ImageOwner clone() => ImageOwner()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ImageOwner copyWith(void Function(ImageOwner) updates) => super.copyWith((message) => updates(message as ImageOwner)) as ImageOwner;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ImageOwner create() => ImageOwner._();
  ImageOwner createEmptyInstance() => create();
  static $pb.PbList<ImageOwner> createRepeated() => $pb.PbList<ImageOwner>();
  @$core.pragma('dart2js:noInline')
  static ImageOwner getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ImageOwner>(create);
  static ImageOwner? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get owner => $_getSZ(0);
  @$pb.TagNumber(1)
  set owner($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOwner() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwner() => clearField(1);

  @$pb.TagNumber(2)
  Confidence get confidence => $_getN(1);
  @$pb.TagNumber(2)
  set confidence(Confidence v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasConfidence() => $_has(1);
  @$pb.TagNumber(2)
  void clearConfidence() => clearField(2);
  @$pb.TagNumber(2)
  Confidence ensureConfidence() => $_ensure(1);
}

class HandOwners extends $pb.GeneratedMessage {
  factory HandOwners({
    $core.Iterable<$core.String>? names,
  }) {
    final $result = create();
    if (names != null) {
      $result.names.addAll(names);
    }
    return $result;
  }
  HandOwners._() : super();
  factory HandOwners.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory HandOwners.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'HandOwners', createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'names')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  HandOwners clone() => HandOwners()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  HandOwners copyWith(void Function(HandOwners) updates) => super.copyWith((message) => updates(message as HandOwners)) as HandOwners;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HandOwners create() => HandOwners._();
  HandOwners createEmptyInstance() => create();
  static $pb.PbList<HandOwners> createRepeated() => $pb.PbList<HandOwners>();
  @$core.pragma('dart2js:noInline')
  static HandOwners getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<HandOwners>(create);
  static HandOwners? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get names => $_getList(0);
}

class Empty extends $pb.GeneratedMessage {
  factory Empty() => create();
  Empty._() : super();
  factory Empty.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Empty.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Empty', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Empty clone() => Empty()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Empty copyWith(void Function(Empty) updates) => super.copyWith((message) => updates(message as Empty)) as Empty;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Empty create() => Empty._();
  Empty createEmptyInstance() => create();
  static $pb.PbList<Empty> createRepeated() => $pb.PbList<Empty>();
  @$core.pragma('dart2js:noInline')
  static Empty getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Empty>(create);
  static Empty? _defaultInstance;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
