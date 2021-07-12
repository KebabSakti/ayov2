import 'package:ayov2/data/data.dart';
import 'package:ayov2/model/model.dart';
import 'package:flutter/material.dart';

class Cart {
  final CartData _cartData = CartData();

  Future<List<CartItemModel>> cart() async {
    return await _cartData.cart();
  }

  Future<List<CartItemModel>> cartUpdate(
      {@required List<CartItemModel> cartItems}) async {
    return await _cartData.cartUpdate(cartItems: cartItems);
  }
}
