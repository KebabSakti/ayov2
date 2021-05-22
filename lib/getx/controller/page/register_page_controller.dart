import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegisterPageController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();

  String fieldValidator(String value) {
    if (value.isEmpty) {
      return 'Field tidak boleh kosong';
    }
    return null;
  }

  void submitRegisterForm() {
    if (formKey.currentState.validate()) {
      print('user terdaftar');
    }
  }

  @override
  void onClose() {
    name.dispose();
    email.dispose();
    phone.dispose();

    super.onClose();
  }
}
