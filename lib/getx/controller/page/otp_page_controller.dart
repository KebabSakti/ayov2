import 'package:ayov2/const/const.dart';
import 'package:ayov2/core/core.dart';
import 'package:ayov2/helper/helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class OtpPageController extends GetxController {
  final AuthFirebase _authFirebase = Get.find();
  final Helper _helper = Get.find();
  final String verificationId = Get.arguments;

  RxString otp = ''.obs;

  void _phoneSignIn() async {
    try {
      _helper.dialog.loading();

      PhoneAuthCredential phoneCredential =
          _authFirebase.phoneCredential(verificationId, otp.value);
      if (phoneCredential != null) {
        await _authFirebase
            .signInWithCredential(phoneCredential)
            .then((result) {
          print(result);

          _routeToHomePage();
        });
      }
    } catch (e) {
      _helper.dialog.close();
      _helper.dialog.error(e.message, dismissible: true);
    }
  }

  void onScreenKeyboardValueListener(String value) {
    if (value != 'OK' && value != 'DEL') {
      if (otp.value.length < 6) otp.value += value;
    }

    if (value == 'DEL') {
      if (otp.value.length > 0) {
        otp.value = otp.value.substring(0, otp.value.length - 1);
      }
    }

    if (value == 'OK') {
      _phoneSignIn();
    }
  }

  void _routeToHomePage() {
    Get.offAllNamed(HOME_PAGE);
  }
}
