import 'package:ayov2/core/core.dart';
import 'package:ayov2/data/data.dart';
import 'package:ayov2/model/model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthLocal {
  final AppPreference _appPreference = Get.find();

  final AuthData _authData = AuthData();

  Future<CustomerModel> registerUser({
    @required String customerId,
    @required String customerPhone,
    @required String customerName,
    @required String customerEmail,
    @required String customerPassword,
    @required String customerFcm,
  }) async {
    return await _authData.register(
      customerId: customerId,
      customerName: customerName,
      customerPhone: customerPhone,
      customerEmail: customerEmail,
      customerPassword: customerId,
      customerFcm: customerFcm,
    );
  }

  Future<CustomerModel> updateUser({
    @required String customerId,
    String customerPhone,
    String customerName,
    String customerEmail,
    String customerPassword,
    String customerFcm,
  }) async {
    return await _authData.update(
      customerId: customerId,
      customerName: customerName,
      customerPhone: customerPhone,
      customerEmail: customerEmail,
      customerPassword: customerId,
      customerFcm: customerFcm,
    );
  }

  Future<CustomerModel> getUser(String userUID) async {
    return await _authData.user(customerId: userUID);
  }

  Future<bool> signout(String userUID) async {
    return await _authData.signout(customerId: userUID);
  }

  Future saveUserPreference(String userUID, String userToken) async {
    await _appPreference.setUserUID(userUID);
    await _appPreference.setUserToken(userToken);
  }
}
