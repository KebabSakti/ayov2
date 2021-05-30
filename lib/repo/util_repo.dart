import 'package:ayov2/const/const.dart';
import 'package:ayov2/service/service.dart';
import 'package:get/get.dart';

class UtilRepo {
  final Network _network = Get.find();

  Future<dynamic> userExist({String phoneNumber, String email}) async {
    var response = await _network.action(
      Methods.POST,
      CUSTOMER_EXIST_API,
      data: {
        'customer_phone': phoneNumber,
        'customer_email': email,
      },
    );

    return response;
  }
}
