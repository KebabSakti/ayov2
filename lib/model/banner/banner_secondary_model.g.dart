// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_secondary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerSecondaryModel _$BannerSecondaryModelFromJson(Map<String, dynamic> json) {
  return BannerSecondaryModel(
    categoryId: json['category_id'] as String,
    bannerSecondaryid: json['banner_secondary_id'] as String,
    bannerSecondaryImage: json['banner_secondary_image'] as String,
    bannerSecondaryLink: json['banner_secondary_link'] as String,
    bannerSecondaryTarget: json['banner_secondary_target'] as String,
  );
}

Map<String, dynamic> _$BannerSecondaryModelToJson(
        BannerSecondaryModel instance) =>
    <String, dynamic>{
      'category_id': instance.categoryId,
      'banner_secondary_id': instance.bannerSecondaryid,
      'banner_secondary_image': instance.bannerSecondaryImage,
      'banner_secondary_link': instance.bannerSecondaryLink,
      'banner_secondary_target': instance.bannerSecondaryTarget,
    };
