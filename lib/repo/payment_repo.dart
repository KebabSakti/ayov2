import 'package:ayov2/const/const.dart';
import 'package:ayov2/core/core.dart';
import 'package:ayov2/service/service.dart';
import 'package:get/get.dart';

class PaymentRepo {
  final Network _network = Get.find();
  final AppPreference _appPreference = Get.find();

  Future<dynamic> paymentChannel() async {
    var response = await _network.action(
      Methods.GET,
      PAYMENT_CHANNEL_API,
      authToken: await _appPreference.getUserToken(),
    );

    return response;
  }
}
