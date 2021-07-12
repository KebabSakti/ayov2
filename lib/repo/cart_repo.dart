import 'package:ayov2/const/const.dart';
import 'package:ayov2/core/core.dart';
import 'package:ayov2/model/model.dart';
import 'package:ayov2/service/service.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartRepo {
  final Network _network = Get.find();
  final AppPreference _appPreference = Get.find();

  Future<dynamic> cart() async {
    var response = await _network.action(
      Methods.POST,
      CART_API,
      authToken: await _appPreference.getUserToken(),
    );

    return response;
  }

  Future<dynamic> cartUpdate({
    @required List<CartItemModel> cartItems,
  }) async {
    var response = await _network.action(
      Methods.POST,
      CART_UPDATE_API,
      authToken: await _appPreference.getUserToken(),
      data: dio.FormData.fromMap({
        "cart_item": cartItems
            .map((item) => {
                  'product_id': item.product.productId,
                  'cart_item_note': item.cartItemNote,
                  'cart_item_qty': item.cartItemQty,
                  'cart_item_price': item.cartItemPrice,
                })
            .toList(),
      }),
    );

    return response;
  }
}
