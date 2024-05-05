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

class ImageAndDataset extends $pb.GeneratedMessage {
  factory ImageAndDataset({
    ImageData? image,
    Dataset? dataset,
  }) {
    final $result = create();
    if (image != null) {
      $result.image = image;
    }
    if (dataset != null) {
      $result.dataset = dataset;
    }
    return $result;
  }
  ImageAndDataset._() : super();
  factory ImageAndDataset.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ImageAndDataset.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ImageAndDataset', createEmptyInstance: create)
    ..aOM<ImageData>(1, _omitFieldNames ? '' : 'image', subBuilder: ImageData.create)
    ..aOM<Dataset>(2, _omitFieldNames ? '' : 'dataset', subBuilder: Dataset.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ImageAndDataset clone() => ImageAndDataset()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ImageAndDataset copyWith(void Function(ImageAndDataset) updates) => super.copyWith((message) => updates(message as ImageAndDataset)) as ImageAndDataset;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ImageAndDataset create() => ImageAndDataset._();
  ImageAndDataset createEmptyInstance() => create();
  static $pb.PbList<ImageAndDataset> createRepeated() => $pb.PbList<ImageAndDataset>();
  @$core.pragma('dart2js:noInline')
  static ImageAndDataset getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ImageAndDataset>(create);
  static ImageAndDataset? _defaultInstance;

  @$pb.TagNumber(1)
  ImageData get image => $_getN(0);
  @$pb.TagNumber(1)
  set image(ImageData v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasImage() => $_has(0);
  @$pb.TagNumber(1)
  void clearImage() => clearField(1);
  @$pb.TagNumber(1)
  ImageData ensureImage() => $_ensure(0);

  @$pb.TagNumber(2)
  Dataset get dataset => $_getN(1);
  @$pb.TagNumber(2)
  set dataset(Dataset v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasDataset() => $_has(1);
  @$pb.TagNumber(2)
  void clearDataset() => clearField(2);
  @$pb.TagNumber(2)
  Dataset ensureDataset() => $_ensure(1);
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

class ImageData extends $pb.GeneratedMessage {
  factory ImageData({
    $core.Iterable<$core.double>? data,
  }) {
    final $result = create();
    if (data != null) {
      $result.data.addAll(data);
    }
    return $result;
  }
  ImageData._() : super();
  factory ImageData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ImageData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ImageData', createEmptyInstance: create)
    ..p<$core.double>(1, _omitFieldNames ? '' : 'data', $pb.PbFieldType.KF)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ImageData clone() => ImageData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ImageData copyWith(void Function(ImageData) updates) => super.copyWith((message) => updates(message as ImageData)) as ImageData;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ImageData create() => ImageData._();
  ImageData createEmptyInstance() => create();
  static $pb.PbList<ImageData> createRepeated() => $pb.PbList<ImageData>();
  @$core.pragma('dart2js:noInline')
  static ImageData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ImageData>(create);
  static ImageData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.double> get data => $_getList(0);
}

class Dataset extends $pb.GeneratedMessage {
  factory Dataset({
    $core.Iterable<ImageData>? images,
    $core.Iterable<$core.String>? owners,
  }) {
    final $result = create();
    if (images != null) {
      $result.images.addAll(images);
    }
    if (owners != null) {
      $result.owners.addAll(owners);
    }
    return $result;
  }
  Dataset._() : super();
  factory Dataset.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Dataset.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Dataset', createEmptyInstance: create)
    ..pc<ImageData>(1, _omitFieldNames ? '' : 'images', $pb.PbFieldType.PM, subBuilder: ImageData.create)
    ..pPS(2, _omitFieldNames ? '' : 'owners')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Dataset clone() => Dataset()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Dataset copyWith(void Function(Dataset) updates) => super.copyWith((message) => updates(message as Dataset)) as Dataset;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Dataset create() => Dataset._();
  Dataset createEmptyInstance() => create();
  static $pb.PbList<Dataset> createRepeated() => $pb.PbList<Dataset>();
  @$core.pragma('dart2js:noInline')
  static Dataset getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Dataset>(create);
  static Dataset? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ImageData> get images => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<$core.String> get owners => $_getList(1);
}

class ImageOwner extends $pb.GeneratedMessage {
  factory ImageOwner({
    $core.bool? isInDatabase,
    $core.String? owner,
  }) {
    final $result = create();
    if (isInDatabase != null) {
      $result.isInDatabase = isInDatabase;
    }
    if (owner != null) {
      $result.owner = owner;
    }
    return $result;
  }
  ImageOwner._() : super();
  factory ImageOwner.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ImageOwner.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ImageOwner', createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isInDatabase')
    ..aOS(2, _omitFieldNames ? '' : 'owner')
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
  $core.bool get isInDatabase => $_getBF(0);
  @$pb.TagNumber(1)
  set isInDatabase($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIsInDatabase() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsInDatabase() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get owner => $_getSZ(1);
  @$pb.TagNumber(2)
  set owner($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasOwner() => $_has(1);
  @$pb.TagNumber(2)
  void clearOwner() => clearField(2);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
