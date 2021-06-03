// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginationModel _$PaginationModelFromJson(Map<String, dynamic> json) {
  return PaginationModel(
    currentPage: json['current_page'] as int,
    perPage: json['per_page'] as int,
    to: json['to'] as int,
    from: json['from'] as int,
    firstPageUrl: json['first_page_url'] as String,
    nextPageUrl: json['next_page_url'] as String,
    prevPageUrl: json['prev_page_url'] as String,
    path: json['path'] as String,
  );
}

Map<String, dynamic> _$PaginationModelToJson(PaginationModel instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'per_page': instance.perPage,
      'to': instance.to,
      'from': instance.from,
      'first_page_url': instance.firstPageUrl,
      'next_page_url': instance.nextPageUrl,
      'prev_page_url': instance.prevPageUrl,
      'path': instance.path,
    };
