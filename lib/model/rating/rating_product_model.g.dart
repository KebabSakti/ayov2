// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RatingProductModel _$RatingProductModelFromJson(Map<String, dynamic> json) {
  return RatingProductModel(
    customerId: json['customer_id'] as String,
    productId: json['product_id'] as String,
    ratingProductId: json['rating_product_id'] as String,
    ratingProductValue: json['rating_product_value'] as String,
    ratingProductComment: json['rating_product_comment'] as String,
    customerName: json['customer_name'] as String,
  );
}

Map<String, dynamic> _$RatingProductModelToJson(RatingProductModel instance) =>
    <String, dynamic>{
      'customer_id': instance.customerId,
      'product_id': instance.productId,
      'rating_product_id': instance.ratingProductId,
      'rating_product_value': instance.ratingProductValue,
      'rating_product_comment': instance.ratingProductComment,
      'customer_name': instance.customerName,
    };
