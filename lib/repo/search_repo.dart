import 'package:ayov2/const/api_const.dart';
import 'package:ayov2/core/core.dart';
import 'package:ayov2/service/service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SearchRepo {
  final Network _network = Get.find();
  final AppPreference _appPreference = Get.find();

  Future<dynamic> search({@required String keyword}) async {
    var response = await _network.action(Methods.POST, SEARCH_API,
        authToken: await _appPreference.getUserToken(),
        data: {
          "keyword": keyword,
        });

    return response;
  }
}
