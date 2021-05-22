import 'dart:convert';

import 'package:ayov2/const/const.dart';
import 'package:ayov2/service/service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UtilRepo {
  final Network _network = Get.find();

  Future<bool> phoneNumberExist({@required String phoneNumber}) async {
    var response = await _network.action(
        Methods.GET, PHONE_NUMBER_EXIST_API + phoneNumber);

    Map result = jsonDecode(response.data);

    return result['success'];
  }
}
