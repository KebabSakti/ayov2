// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) {
  return CategoryModel(
    categoryId: json['category_id'] as String,
    categoryName: json['category_name'] as String,
    categoryImage: json['category_image'] as String,
    categoryView: json['category_view'] as int,
    categoryDeeplink: json['category_depplink'] as String,
    categoryActive: json['category_active'] as int,
    categoryGroup: json['category_group'] as String,
    categoryOrder: json['category_order'] as int,
    categoryDescription: json['category_description'] as String,
  );
}

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      'category_id': instance.categoryId,
      'category_name': instance.categoryName,
      'category_image': instance.categoryImage,
      'category_view': instance.categoryView,
      'category_depplink': instance.categoryDeeplink,
      'category_active': instance.categoryActive,
      'category_order': instance.categoryOrder,
      'category_group': instance.categoryGroup,
      'category_description': instance.categoryDescription,
    };
