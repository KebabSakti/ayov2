import 'dart:convert';

import 'package:ayov2/model/model.dart';
import 'package:ayov2/repo/repo.dart';
import 'package:flutter/material.dart';

class CartData {
  final CartRepo _cartRepo = CartRepo();

  Future<List<CartItemModel>> cart() async {
    var response = await _cartRepo.cart();

    var parsedData = await jsonDecode(response.data);

    if (!parsedData['success']) throw Exception(parsedData['message']);

    List<CartItemModel> cartItems = List<CartItemModel>.from(
      await parsedData['data'].map(
        (item) => CartItemModel.fromJson(item),
      ),
    );

    return cartItems;
  }

  Future<List<CartItemModel>> cartUpdate({
    @required List<CartItemModel> cartItems,
  }) async {
    var response = await _cartRepo.cartUpdate(cartItems: cartItems);

    var parsedData = await jsonDecode(response.data);

    if (!parsedData['success']) throw Exception(parsedData['message']);

    List<CartItemModel> carts = List<CartItemModel>.from(
      await parsedData['data'].map(
        (item) => CartItemModel.fromJson(item),
      ),
    );

    return carts;
  }
}
