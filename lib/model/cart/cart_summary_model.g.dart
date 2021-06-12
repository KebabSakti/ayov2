// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_summary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartSummaryModel _$CartSummaryModelFromJson(Map<String, dynamic> json) {
  return CartSummaryModel(
    customerId: json['customer_id'] as String,
    cartId: json['cart_id'] as String,
    cartInvoice: json['customer_invoice'] as String,
    cartQtyTotal: json['customer_qty_total'] as int,
    cartPriceTotal: (json['customer_price_total'] as num).toDouble(),
  );
}

Map<String, dynamic> _$CartSummaryModelToJson(CartSummaryModel instance) =>
    <String, dynamic>{
      'customer_id': instance.customerId,
      'cart_id': instance.cartId,
      'customer_invoice': instance.cartInvoice,
      'customer_qty_total': instance.cartQtyTotal,
      'customer_price_total': instance.cartPriceTotal,
    };
