import 'package:ayov2/const/api.dart';
import 'package:ayov2/core/core.dart';
import 'package:ayov2/service/service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthRepo {
  final Network _network = Get.find();
  final AppPreference _appPreference = Get.find();

  Future<dynamic> register({
    @required String customerId,
    @required String customerPhone,
    @required String customerName,
    @required String customerEmail,
    @required String customerPassword,
    @required String customerFcm,
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
        'customer_fcm': customerFcm,
      },
    );

    return response;
  }

  Future<dynamic> update({
    @required String customerId,
    @required String customerPhone,
    @required String customerName,
    @required String customerEmail,
    @required String customerPassword,
    @required String customerFcm,
  }) async {
    var response = await _network.action(
      Methods.POST,
      CUSTOMER_UPDATE_API,
      data: {
        'customer_id': customerId,
        'customer_phone': customerPhone,
        'customer_name': customerName,
        'customer_email': customerEmail,
        'customer_password': customerPassword,
        'customer_fcm': customerFcm,
      },
    );

    return response;
  }

  Future<dynamic> customer({@required String customerId}) async {
    var response = await _network.action(
      Methods.POST,
      CUSTOMER_FETCH_ONE_API,
      data: {
        'customer_id': customerId,
        'auth_token': await _appPreference.getUserToken('user_token'),
      },
    );

    return response;
  }

  Future<dynamic> signout({@required String customerId}) async {
    var response = await _network.action(
      Methods.POST,
      CUSTOMER_SIGNOUT_API,
      authToken: await _appPreference.getUserToken('user_token'),
      data: {
        'customer_id': customerId,
      },
    );

    return response;
  }
}
