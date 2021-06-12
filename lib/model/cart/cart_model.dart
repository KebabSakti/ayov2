import 'package:ayov2/model/cart/cart_item_model.dart';
import 'package:ayov2/model/cart/cart_summary_model.dart';

class CartModel {
  CartModel({
    this.summary,
    this.items = const [],
  });

  CartSummaryModel summary;
  List<CartItemModel> items;

  CartModel copyWith(
    CartSummaryModel summary,
    List<CartItemModel> items,
  ) =>
      CartModel();
}
