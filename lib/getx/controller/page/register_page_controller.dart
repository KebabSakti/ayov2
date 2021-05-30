import 'package:ayov2/const/const.dart';
import 'package:ayov2/core/core.dart';
import 'package:ayov2/helper/helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class RegisterPageController extends GetxController {
  final AuthFirebase _authFirebase = Get.find();
  final AuthLocal _authLocal = Get.find();
  final Helper _helper = Get.find();

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

      if (!await _authLocal.exist(
          phoneNumber: phoneNumber.toString(), email: emailField.text))
        throw Exception('Phone number or email already registered');

      await _authFirebase.signInWithPhone(
        phoneNumber.toString(),
        codeAutoRetrievalTimeout: (String verificationId) {
          print('TIMEOUT');
          print(verificationId);
        },
        verificationFailed: (FirebaseAuthException exception) {
          throw exception;
        },
        codeSent: (String verificationId, int resendToken) async {
          var credential = await _routeToOtpPage(verificationId);

          if (credential == null)
            _helper.dialog.close();
          else
            await _authFirebase.signInWithCredential(credential);
        },
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _authFirebase.signInWithCredential(credential);
        },
      );
    } catch (e) {
      _helper.dialog.close();
      _helper.dialog.error(e.toString(), dismissible: true);
    }
  }

  Future<dynamic> _routeToOtpPage(String verificationId) async {
    return await Get.toNamed(OTP_PAGE, arguments: verificationId);
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
