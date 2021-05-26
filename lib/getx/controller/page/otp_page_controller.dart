import 'package:ayov2/const/const.dart';
import 'package:ayov2/core/core.dart';
import 'package:ayov2/getx/getx.dart';
import 'package:ayov2/helper/helper.dart';
import 'package:ayov2/model/model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class OtpPageController extends GetxController {
  final AuthFirebase _authFirebase = Get.find();
  final Helper _helper = Get.find();
  final AuthLocal _authLocal = Get.find();
  final GlobalObs _globalObs = Get.find();

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
          _validateUser(result);
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

  Future _validateUser(UserCredential userCredential) async {
    CustomerModel customerModel;

    if (userCredential.additionalUserInfo.isNewUser) {
      customerModel = await _authLocal.registerUser(
        customerId: userCredential.user.uid,
        customerName: userCredential.user.displayName,
        customerPhone: userCredential.user.phoneNumber,
        customerEmail: userCredential.user.email,
        customerFcm: null,
        customerPassword: userCredential.user.uid,
      );
    } else {
      customerModel = await _authLocal.getUser(userCredential.user.uid);
    }

    await _authLocal.saveUserPreference(
        customerModel.customerId, customerModel.customerToken);

    _globalObs.customerModel(customerModel);

    _routeToHomePage();
  }

  void _routeToHomePage() {
    Get.offAllNamed(HOME_PAGE);
  }
}
