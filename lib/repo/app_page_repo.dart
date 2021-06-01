import 'package:ayov2/const/const.dart';
import 'package:ayov2/core/core.dart';
import 'package:ayov2/service/service.dart';
import 'package:get/get.dart';

class AppPageRepo {
  final Network _network = Get.find();
  final AppPreference _appPreference = Get.find();

  Future<dynamic> home() async {
    var response = await _network.action(
      Methods.GET,
      HOME_PAGE_API,
      authToken: await _appPreference.getUserToken(),
    );

    return response;
  }
}
