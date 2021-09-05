import 'dart:async';

import 'package:ayov2/const/const.dart';
import 'package:ayov2/core/core.dart';
import 'package:ayov2/helper/helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class OtpPageController extends GetxController {
  final AuthFirebase _authFirebase = Get.find();
  final Helper _helper = Get.find();

  final String phoneNumber = Get.arguments[2];
  String verificationId = Get.arguments[0];
  int resendToken = Get.arguments[1];

  RxString otp = ''.obs;
  RxInt duration = 0.obs;

  void _resendOtp() async {
    try {
      await _authFirebase.signInWithPhone(
        phoneNumber,
        forceResendingToken: resendToken,
        codeAutoRetrievalTimeout: (String verificationId) {
          print('TIMEOUT');
          print(verificationId);
        },
        verificationFailed: (FirebaseAuthException exception) {
          throw exception;
        },
        codeSent: (String verId, int resToken) async {
          verificationId = verId;
          resendToken = resToken;
        },
        verificationCompleted: (PhoneAuthCredential credential) async {
          //
        },
      );
    } on FirebaseAuthException catch (_) {
      _helper.dialog.close();
      _helper.toast.show(GENERAL_MESSAGE);
    } catch (e) {
      _helper.dialog.close();
      _helper.toast.show(e.message);
    }
  }

  Future _otpSignIn() async {
    try {
      _helper.dialog.loading();

      PhoneAuthCredential phoneCredential =
          _authFirebase.phoneCredential(verificationId, otp.value);

      if (phoneCredential != null)
        await _authFirebase
            .signInWithCredential(phoneCredential)
            .then((result) => Get.back(result: result, closeOverlays: true));
    } on FirebaseAuthException catch (e) {
      _helper.dialog.close();
      if (e.code == 'invalid-verification-code')
        _helper.toast.show(INVALID_OTP_CODE);
      else
        _helper.toast.show(GENERAL_MESSAGE);
    } catch (e) {
      _helper.dialog.close();
      _helper.toast.show(e.message);
    }
  }

  void _timer() {
    duration.value = 60;
    Timer.periodic(Duration(seconds: 1), (Timer timer) {
      duration.value -= 1;
      if (duration.value == 0) timer.cancel();
    });
  }

  Future<void> onScreenKeyboardValueListener(String value) async {
    if (value != 'OK' && value != 'DEL') {
      if (otp.value.length < 6) otp.value += value;
    }

    if (value == 'DEL') {
      if (otp.value.length > 0) {
        otp.value = otp.value.substring(0, otp.value.length - 1);
      }
    }

    if (value == 'OK') {
      await _otpSignIn();
    }
  }

  void resendButton() {
    _timer();
    _resendOtp();
  }

  void _init() {
    _timer();
  }

  @override
  void onInit() {
    _init();
    super.onInit();
  }
}
