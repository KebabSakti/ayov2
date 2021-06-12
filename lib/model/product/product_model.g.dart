// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) {
  return ProductModel(
    categoryId: json['category_id'] as String,
    subCategoryId: json['sub_category_id'] as String,
    productId: json['product_id'] as String,
    productIsExclusive: json['product_is_exclusive'] as int,
    productDeliveryType: json['product_delivery_type'] as String,
    productDeeplink: json['product_deeplin'] as String,
    productName: json['product_name'] as String,
    productDescription: json['product_description'] as String,
    productCover: json['product_cover'] as String,
    productPrice: json['product_price'] as String,
    productDiscount: json['product_discount'] as String,
    productFinalPrice: json['product_final_price'] as String,
    productUnit: json['product_unit'] as String,
    productPoint: json['product_point'] as int,
    productView: json['product_view'] as int,
    productSold: json['product_sold'] as int,
    productSearch: json['product_search'] as int,
    productRatingCount: json['product_rating_count'] as int,
    productRatingValue: json['product_rating_value'] as String,
    productActive: json['product_active'] as int,
    productFavourite: json['product_favourite'] as int,
  );
}

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'category_id': instance.categoryId,
      'sub_category_id': instance.subCategoryId,
      'product_id': instance.productId,
      'product_is_exclusive': instance.productIsExclusive,
      'product_delivery_type': instance.productDeliveryType,
      'product_deeplin': instance.productDeeplink,
      'product_name': instance.productName,
      'product_description': instance.productDescription,
      'product_cover': instance.productCover,
      'product_price': instance.productPrice,
      'product_discount': instance.productDiscount,
      'product_final_price': instance.productFinalPrice,
      'product_unit': instance.productUnit,
      'product_point': instance.productPoint,
      'product_view': instance.productView,
      'product_sold': instance.productSold,
      'product_search': instance.productSearch,
      'product_rating_count': instance.productRatingCount,
      'product_rating_value': instance.productRatingValue,
      'product_active': instance.productActive,
      'product_favourite': instance.productFavourite,
    };
