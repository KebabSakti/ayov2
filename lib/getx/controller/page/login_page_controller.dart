import 'package:ayov2/const/const.dart';
import 'package:ayov2/core/core.dart';
import 'package:ayov2/helper/helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class LoginPageController extends GetxController {
  final AuthFirebase _authFirebase = Get.find();
  final AuthLocal _authLocal = Get.find();
  final Helper _helper = Get.find();

  final TextEditingController phoneField = TextEditingController();

  void facebookSignIn() async {
    await _socialSignIn(await _authFirebase.facebookCredential());
  }

  void googleSignIn() async {
    await _socialSignIn(await _authFirebase.googleCredential());
  }

  Future _socialSignIn(OAuthCredential credential) async {
    try {
      if (credential != null) {
        _helper.dialog.loading();
        await _authFirebase.signInWithCredential(credential);
      }
    } catch (e) {
      _helper.dialog.close();
      _helper.dialog.error(e.toString(), dismissible: true);
    }
  }

  void phoneSignIn() async {
    try {
      if (phoneField.text.length == 0)
        throw Exception('Phone number cannot be empty');

      _helper.dialog.loading();

      PhoneNumber phoneNumber = await PhoneNumber.getRegionInfoFromPhoneNumber(
          '+62${phoneField.text}', 'ID');

      if (await _authLocal.exist(phoneNumber: phoneNumber.toString()))
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
          _routeToOtpPage(verificationId, resendToken);
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

  void _routeToOtpPage(String verificationId, int resendToken) async {
    Get.toNamed(OTP_PAGE, arguments: [verificationId, resendToken]);
  }

  @override
  void dispose() {
    phoneField.dispose();
    super.dispose();
  }
}
