// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bundle_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BundleModel _$BundleModelFromJson(Map<String, dynamic> json) {
  return BundleModel(
    id: json['id'] as int,
    bundleId: json['bundle_id'] as String,
    bundleName: json['bundle_name'] as String,
    bundleDescription: json['bundle_description'] as String,
    bundleImage: json['bundle_image'] as String,
    bundleBackground: json['bundle_background'] as String,
    bundleShow: json['bundle_show'] as int,
    bundleActive: json['bundle_active'] as int,
    products: (json['products'] as List)
        .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$BundleModelToJson(BundleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bundle_id': instance.bundleId,
      'bundle_name': instance.bundleName,
      'bundle_description': instance.bundleDescription,
      'bundle_image': instance.bundleImage,
      'bundle_background': instance.bundleBackground,
      'bundle_show': instance.bundleShow,
      'bundle_active': instance.bundleActive,
      'products': instance.products,
    };
