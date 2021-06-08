// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchModel _$SearchModelFromJson(Map<String, dynamic> json) {
  return SearchModel(
    customerId: json['customer_id'] as String,
    searchId: json['search_id'] as String,
    searchKeyword: json['search_keyword'] as String,
    searchImage: json['search_image'] as String,
    searchCount: json['search_count'] as int,
  );
}

Map<String, dynamic> _$SearchModelToJson(SearchModel instance) =>
    <String, dynamic>{
      'customer_id': instance.customerId,
      'search_id': instance.searchId,
      'search_keyword': instance.searchKeyword,
      'search_image': instance.searchImage,
      'search_count': instance.searchCount,
    };
