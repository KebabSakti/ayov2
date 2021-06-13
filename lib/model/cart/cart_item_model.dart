import 'package:ayov2/model/model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart_item_model.g.dart';

@JsonSerializable(nullable: true)
class CartItemModel {
  CartItemModel({
    this.customerId,
    this.productId,
    this.cartItemId,
    this.cartItemNote,
    this.cartItemQty,
    this.cartItemPrice,
    this.cartItemChecked,
    this.product,
  });

  @JsonKey(name: 'customer_id', nullable: true)
  String customerId;
  @JsonKey(name: 'product_id', nullable: true)
  String productId;
  @JsonKey(name: 'cart_item_id', nullable: true)
  String cartItemId;
  @JsonKey(name: 'cart_item_note', nullable: true)
  String cartItemNote;
  @JsonKey(name: 'cart_item_qty', nullable: true)
  int cartItemQty;
  @JsonKey(name: 'cart_item_price', nullable: true)
  String cartItemPrice;
  @JsonKey(name: 'cart_item_checked', nullable: true)
  int cartItemChecked;
  @JsonKey(name: 'product', nullable: true)
  ProductModel product;

  CartItemModel copyWith({
    String customerId,
    String cartItemId,
    String cartItemNote,
    int cartItemQty,
    String cartItemPrice,
    int cartItemChecked,
    ProductModel product,
  }) =>
      CartItemModel(
        customerId: customerId ?? this.customerId,
        cartItemId: cartItemId ?? this.cartItemId,
        cartItemNote: cartItemNote ?? cartItemNote,
        cartItemQty: cartItemQty ?? this.cartItemQty,
        cartItemPrice: cartItemPrice ?? this.cartItemPrice,
        cartItemChecked: cartItemChecked ?? this.cartItemChecked,
        product: product ?? this.product,
      );

  factory CartItemModel.fromJson(Map<String, dynamic> json) =>
      _$CartItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartItemModelToJson(this);
}
