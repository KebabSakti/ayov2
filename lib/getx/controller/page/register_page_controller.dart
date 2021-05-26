import 'package:ayov2/const/const.dart';
import 'package:ayov2/core/core.dart';
import 'package:ayov2/getx/getx.dart';
import 'package:ayov2/helper/helper.dart';
import 'package:ayov2/model/model.dart';
import 'package:ayov2/repo/repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class RegisterPageController extends GetxController {
  final AuthFirebase _authFirebase = Get.find();
  final AuthLocal _authLocal = Get.find();
  final Helper _helper = Get.find();
  final GlobalObs _globalObs = Get.find();

  final UtilRepo _utilRepo = UtilRepo();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameField = TextEditingController();
  final TextEditingController emailField = TextEditingController();
  final TextEditingController phoneField = TextEditingController();

  void phoneSignIn() async {
    try {
      if (phoneField.text.length == 0)
        throw Exception('Phone number cannot be empty');

      _helper.dialog.loading();

      PhoneNumber phoneNumber = await PhoneNumber.getRegionInfoFromPhoneNumber(
          '+62${phoneField.text}', 'ID');

      if (!await _utilRepo.phoneNumberExist(
          phoneNumber: phoneNumber.toString()))
        throw Exception('Phone number not yet registered');

      await _authFirebase.signInWithPhone(
        phoneNumber.toString(),
        codeAutoRetrievalTimeout: (String verificationId) {
          print('TIMEOUT');
          print(verificationId);
        },
        verificationFailed: (FirebaseAuthException exception) {
          throw exception;
        },
        codeSent: (String verificationId, int resendToken) {
          _helper.dialog.close();
          _routeToOtpPage(verificationId);
        },
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _authFirebase
              .signInWithCredential(credential)
              .then((result) async {
            _validateUser(result);
          });
        },
      );
    } catch (e) {
      _helper.dialog.close();
      _helper.dialog.error(e.toString(), dismissible: true);
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

  void _routeToOtpPage(String verificationId) {
    Get.toNamed(OTP_PAGE, arguments: verificationId);
  }

  void _routeToHomePage() {
    Get.offAllNamed(HOME_PAGE);
  }

  String fieldValidator(String value) {
    if (value.isEmpty) {
      return 'Field tidak boleh kosong';
    }
    return null;
  }

  void submitRegisterForm() {
    if (formKey.currentState.validate()) {
      phoneSignIn();
    }
  }

  @override
  void onClose() {
    nameField.dispose();
    emailField.dispose();
    phoneField.dispose();

    super.onClose();
  }
}
