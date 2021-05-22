import 'package:ayov2/const/api.dart';
import 'package:ayov2/service/service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomerRepo {
  final Network _network = Get.find();

  Future<dynamic> register({
    @required String customerId,
    @required String customerPhone,
    @required String customerName,
    @required String customerEmail,
    @required String customerPassword,
  }) async {
    var response = await _network.action(
      Methods.POST,
      CUSTOMER_REGISTER_API,
      data: {
        'customer_id': customerId,
        'customer_phone': customerPhone,
        'customer_name': customerName,
        'customer_email': customerEmail,
        'customer_password': customerPassword,
      },
    );

    return response;
  }

  Future<dynamic> customer({@required String customerId}) async {
    var response =
        await _network.action(Methods.GET, CUSTOMER_FETCH_ONE_API + customerId);

    return response;
  }
}
