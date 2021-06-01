// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubCategoryModel _$SubCategoryModelFromJson(Map<String, dynamic> json) {
  return SubCategoryModel(
    categoryId: json['category_id'] as String,
    subCategoryName: json['sub_category_name'] as String,
    subCategoryImage: json['sub_category_image'] as String,
    subCategoryView: json['sub_category_view'] as int,
    subCategoryDeeplink: json['sub_category_deeplink'] as String,
    subCategoryActive: json['sub_category_active'] as int,
  )..subCategoryId = json['sub_category_id'] as String;
}

Map<String, dynamic> _$SubCategoryModelToJson(SubCategoryModel instance) =>
    <String, dynamic>{
      'category_id': instance.categoryId,
      'sub_category_id': instance.subCategoryId,
      'sub_category_name': instance.subCategoryName,
      'sub_category_image': instance.subCategoryImage,
      'sub_category_view': instance.subCategoryView,
      'sub_category_deeplink': instance.subCategoryDeeplink,
      'sub_category_active': instance.subCategoryActive,
    };
