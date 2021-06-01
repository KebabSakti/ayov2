// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_primary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerPrimaryModel _$BannerPrimaryModelFromJson(Map<String, dynamic> json) {
  return BannerPrimaryModel(
    bannerPrimaryid: json['banner_primary_id'] as String,
    bannerPrimaryImage: json['banner_primary_image'] as String,
    bannerPrimaryLink: json['banner_primary_link'] as String,
    bannerPrimaryTarget: json['banner_primary_target'] as String,
  );
}

Map<String, dynamic> _$BannerPrimaryModelToJson(BannerPrimaryModel instance) =>
    <String, dynamic>{
      'banner_primary_id': instance.bannerPrimaryid,
      'banner_primary_image': instance.bannerPrimaryImage,
      'banner_primary_link': instance.bannerPrimaryLink,
      'banner_primary_target': instance.bannerPrimaryTarget,
    };
