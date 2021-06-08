// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_view_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductViewModel _$ProductViewModelFromJson(Map<String, dynamic> json) {
  return ProductViewModel(
    customerId: json['customer_id'] as String,
    productId: json['product_id'] as String,
    productViewId: json['product_view_id'] as String,
    productViewCount: json['product_view_count'] as int,
    productCover: json['product_cover'] as String,
  );
}

Map<String, dynamic> _$ProductViewModelToJson(ProductViewModel instance) =>
    <String, dynamic>{
      'customer_id': instance.customerId,
      'product_id': instance.productId,
      'product_view_id': instance.productViewId,
      'product_view_count': instance.productViewCount,
      'product_cover': instance.productCover,
    };
