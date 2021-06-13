// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartItemModel _$CartItemModelFromJson(Map<String, dynamic> json) {
  return CartItemModel(
    customerId: json['customer_id'] as String,
    productId: json['product_id'] as String,
    cartItemId: json['cart_item_id'] as String,
    cartItemNote: json['cart_item_note'] as String,
    cartItemQty: json['cart_item_qty'] as int,
    cartItemPrice: json['cart_item_price'] as String,
    cartItemChecked: json['cart_item_checked'] as int,
    product: json['product'] == null
        ? null
        : ProductModel.fromJson(json['product'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CartItemModelToJson(CartItemModel instance) =>
    <String, dynamic>{
      'customer_id': instance.customerId,
      'product_id': instance.productId,
      'cart_item_id': instance.cartItemId,
      'cart_item_note': instance.cartItemNote,
      'cart_item_qty': instance.cartItemQty,
      'cart_item_price': instance.cartItemPrice,
      'cart_item_checked': instance.cartItemChecked,
      'product': instance.product,
    };
