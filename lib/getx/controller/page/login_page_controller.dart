import 'package:ayov2/const/const.dart';
import 'package:ayov2/core/core.dart';
import 'package:ayov2/getx/getx.dart';
import 'package:ayov2/helper/helper.dart';
import 'package:ayov2/model/model.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class LoginPageController extends GetxController {
  final GlobalObs _globalObs = Get.find();
  final AppPreference _appPreference = Get.find();
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
        await _authFirebase
            .signInWithCredential(credential)
            .then((result) => _authenticate(result.user));
      }
    } catch (_) {
      _helper.dialog.close();
      _helper.dialog.error(GENERAL_MESSAGE, dismissible: true);
    }
  }

  void phoneSignIn() async {
    try {
      if (phoneField.text.length == 0) throw Failure(PHONE_REQUIRED);

      _helper.dialog.loading();

      PhoneNumber phoneNumber = await PhoneNumber.getRegionInfoFromPhoneNumber(
          '+62${phoneField.text}', 'ID');

      if (await _authLocal.exist(phoneNumber: phoneNumber.toString()))
        throw Failure(PHONE_NOT_REGISTERED);

      await _authFirebase.signInWithPhone(
        phoneNumber.toString(),
        codeAutoRetrievalTimeout: (String verificationId) {
          print('TIMEOUT');
          print(verificationId);
        },
        verificationFailed: (FirebaseAuthException exception) {
          throw Failure(GENERAL_MESSAGE);
        },
        codeSent: (String verificationId, int resendToken) async {
          var userCredential = await _routeToOtpPage(
              verificationId, resendToken, phoneNumber.toString());

          if (userCredential == null)
            _helper.dialog.close();
          else
            _authenticate(userCredential.user);
        },
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _authFirebase
              .signInWithCredential(credential)
              .then((result) => _authenticate(result.user));
        },
      );
    } on DioError {
      _helper.dialog.close();
      _helper.dialog.error(DIOERROR_MESSAGE, dismissible: true);
    } catch (e) {
      _helper.dialog.close();
      _helper.dialog.error(e.message, dismissible: true);
    }
  }

  void _authenticate(User user) async {
    try {
      CustomerModel customerModel = await _authLocal.authenticate(
        customerId: user.uid,
        customerName: user.displayName,
        customerPhone: user.phoneNumber,
        customerEmail: user.email,
        customerPassword: user.uid,
        customerFcm: await _appPreference.getFcmToken(),
      );

      await _authLocal.saveUserPreference(
          customerModel.customerId, customerModel.customerToken);

      _globalObs.customerModel(customerModel);

      _routeToAppPage();
    } on DioError {
      _helper.dialog.close();
      _helper.dialog.error(DIOERROR_MESSAGE, dismissible: true);
    }
  }

  Future<dynamic> _routeToOtpPage(
      String verificationId, int resendToken, String phoneNumber) async {
    return await Get.toNamed(OTP_PAGE,
        arguments: [verificationId, resendToken, phoneNumber]);
  }

  void _routeToAppPage() {
    Get.offAllNamed(APP_PAGE);
  }

  @override
  void dispose() {
    phoneField.dispose();
    super.dispose();
  }
}
