import 'package:ayov2/getx/getx.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends GetView<RegisterPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.grey[800],
        ),
      ),
      body: Form(
        key: controller.formKey,
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Daftar Baru',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: controller.name,
              autofocus: false,
              cursorColor: Colors.grey[800],
              cursorWidth: 1,
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                fontSize: 16,
                height: 1,
              ),
              decoration: InputDecoration(
                labelText: 'Nama',
                contentPadding: EdgeInsets.symmetric(vertical: 5),
                labelStyle: TextStyle(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.normal,
                ),
                errorStyle: TextStyle(color: Colors.red),
                errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[200]),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[200]),
                ),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[200]),
                ),
              ),
              validator: controller.fieldValidator,
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: controller.email,
              autofocus: false,
              cursorColor: Colors.grey[800],
              cursorWidth: 1,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                fontSize: 16,
                height: 1,
              ),
              decoration: InputDecoration(
                labelText: 'Email',
                contentPadding: EdgeInsets.symmetric(vertical: 5),
                labelStyle: TextStyle(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.normal,
                ),
                errorStyle: TextStyle(color: Colors.red),
                errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[200]),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[200]),
                ),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[200]),
                ),
              ),
              validator: controller.fieldValidator,
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: controller.phone,
              autofocus: false,
              cursorColor: Colors.grey[800],
              cursorWidth: 1,
              keyboardType: TextInputType.phone,
              textInputAction: TextInputAction.done,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                fontSize: 16,
                height: 1,
              ),
              decoration: InputDecoration(
                alignLabelWithHint: true,
                labelText: 'No Hp',
                contentPadding: EdgeInsets.symmetric(vertical: 5),
                prefix: Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Text(
                    '+62',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                      height: 1,
                    ),
                  ),
                ),
                labelStyle: TextStyle(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.normal,
                ),
                errorStyle: TextStyle(color: Colors.red),
                errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[200]),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[200]),
                ),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[200]),
                ),
              ),
              validator: controller.fieldValidator,
            ),
            SizedBox(
              height: 29,
            ),
            SizedBox(
              width: double.infinity,
              height: 40,
              child: FlatButton(
                onPressed: controller.submitRegisterForm,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                color: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  'Daftar',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, right: 5),
              child: Align(
                alignment: Alignment.center,
                child: RichText(
                  textAlign: TextAlign.right,
                  text: TextSpan(
                    text: 'sudah punya akun? ',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: 'login',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.back();
                          },
                        style: TextStyle(
                          color: Get.theme.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
