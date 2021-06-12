import 'package:json_annotation/json_annotation.dart';

part 'cart_item_model.g.dart';

@JsonSerializable(nullable: true)
class CartItemModel {
  CartItemModel({
    String cartId,
    String customerId,
    String cartItemId,
    String cartItemNote,
    int cartItemQty,
    double cartItemPrice,
    bool cartItemChecked,
  });

  @JsonKey(name: 'cart_id', nullable: true)
  String cartId;
  @JsonKey(name: 'customer_id', nullable: true)
  String customerId;
  @JsonKey(name: 'cart_item_id', nullable: true)
  String cartItemId;
  @JsonKey(name: 'cart_item_note', nullable: true)
  String cartItemNote;
  @JsonKey(name: 'cart_item_qty', nullable: true)
  int cartItemQty;
  @JsonKey(name: 'cart_item_price', nullable: true)
  double cartItemPrice;
  @JsonKey(name: 'cart_item_checked', nullable: true)
  bool cartItemChecked;

  CartItemModel copyWith({
    String cartId,
    String customerId,
    String cartItemId,
    String cartItemNote,
    int cartItemQty,
    double cartItemPrice,
    bool cartItemChecked,
  }) =>
      CartItemModel(
        cartId: cartId ?? this.cartId,
        customerId: customerId ?? this.customerId,
        cartItemId: cartItemId ?? this.cartItemId,
        cartItemNote: cartItemNote ?? cartItemNote,
        cartItemQty: cartItemQty ?? this.cartItemQty,
        cartItemPrice: cartItemPrice ?? this.cartItemPrice,
        cartItemChecked: cartItemChecked ?? this.cartItemChecked,
      );

  factory CartItemModel.fromJson(Map<String, dynamic> json) =>
      _$CartItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartItemModelToJson(this);
}
