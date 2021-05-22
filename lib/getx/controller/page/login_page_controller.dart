import 'package:ayov2/const/const.dart';
import 'package:ayov2/core/core.dart';
import 'package:ayov2/getx/getx.dart';
import 'package:ayov2/helper/helper.dart';
import 'package:ayov2/model/customer/customer_model.dart';
import 'package:ayov2/repo/repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class LoginPageController extends GetxController {
  final AuthFirebase _authFirebase = Get.find();
  final Helper _helper = Get.find();
  final GlobalObs _globalObs = Get.find();
  final AppPreference _appPreference = Get.find();

  final UtilRepo _utilRepo = UtilRepo();
  final Customer _customer = Customer();
  final TextEditingController phoneField = TextEditingController();

  void facebookSignIn() async {
    try {
      OAuthCredential facebookCredential =
          await _authFirebase.facebookCredential();
      if (facebookCredential != null) {
        await _authFirebase
            .signInWithCredential(facebookCredential)
            .then((result) async {
          _validateUser(result);
        });
      }
    } catch (e) {
      _helper.dialog.error(e.toString(), dismissible: true);
    }
  }

  void googleSignIn() async {
    try {
      OAuthCredential googleCredential = await _authFirebase.googleCredential();
      if (googleCredential != null) {
        await _authFirebase
            .signInWithCredential(googleCredential)
            .then((result) async {
          _validateUser(result);
        });
      }
    } catch (e) {
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

      if (!await _phoneNumberExist(phoneNumber.toString()))
        throw Exception('Phone number not yet registered');

      await _authFirebase.signInWithPhone(
        phoneNumber.toString(),
        codeAutoRetrievalTimeout: (String verificationId) {
          print('TIMEOUT');
          print(verificationId);
        },
        verificationFailed: (FirebaseAuthException e) {
          throw e;
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

  Future<bool> _phoneNumberExist(String phoneNumber) async {
    return await _utilRepo.phoneNumberExist(phoneNumber: phoneNumber);
  }

  Future<CustomerModel> _registerUser(User user) async {
    return await _customer.register(
      customerId: user.uid,
      customerName: user.displayName,
      customerPhone: user.phoneNumber,
      customerEmail: user.email,
      customerPassword: user.uid,
    );
  }

  Future<CustomerModel> _getUser(String userUID) async {
    return await _customer.user(customerId: userUID);
  }

  Future _saveUserPreference(String userUID, String userToken) async {
    await _appPreference.setUserUID(userUID);
    await _appPreference.setUserToken(userToken);
  }

  Future _validateUser(UserCredential userCredential) async {
    CustomerModel customerModel;

    if (userCredential.additionalUserInfo.isNewUser) {
      customerModel = await _registerUser(userCredential.user);
    } else {
      customerModel = await _getUser(userCredential.user.uid);
    }

    await _saveUserPreference(
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
}
