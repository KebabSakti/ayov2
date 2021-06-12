import 'package:json_annotation/json_annotation.dart';

part 'cart_summary_model.g.dart';

@JsonSerializable(nullable: true)
class CartSummaryModel {
  CartSummaryModel({
    String customerId,
    String cartId,
    String cartInvoice,
    int cartQtyTotal = 0,
    double cartPriceTotal = 0.0,
  });

  @JsonKey(name: 'customer_id', nullable: true)
  String customerId;
  @JsonKey(name: 'cart_id', nullable: true)
  String cartId;
  @JsonKey(name: 'customer_invoice', nullable: true)
  String cartInvoice;
  @JsonKey(name: 'customer_qty_total', nullable: false)
  int cartQtyTotal;
  @JsonKey(name: 'customer_price_total', nullable: false)
  double cartPriceTotal;

  CartSummaryModel copyWith({
    String customerId,
    String cartId,
    String cartInvoice,
    int cartQtyTotal,
    double cartPriceTotal,
  }) =>
      CartSummaryModel(
        customerId: customerId ?? this.customerId,
        cartId: cartId ?? this.cartId,
        cartInvoice: cartInvoice ?? this.cartInvoice,
        cartQtyTotal: cartQtyTotal ?? this.cartQtyTotal,
        cartPriceTotal: cartPriceTotal ?? this.cartPriceTotal,
      );

  factory CartSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$CartSummaryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartSummaryModelToJson(this);
}
