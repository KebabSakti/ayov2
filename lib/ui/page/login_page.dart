import 'package:ayov2/const/const.dart';
import 'package:ayov2/getx/getx.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.only(
              left: 20, right: 20, bottom: 20, top: Get.size.height / 2),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(LOGIN_BACKGROUND),
              alignment: Alignment.topCenter,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: controller.phoneField,
                  autofocus: false,
                  cursorColor: Colors.grey[800],
                  cursorWidth: 1,
                  keyboardType: TextInputType.phone,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                  decoration: InputDecoration(
                    hintText: '812 5498 2664',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    contentPadding: EdgeInsets.only(
                      top: 15,
                    ),
                    hintStyle: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 16,
                      letterSpacing: 2,
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(top: 15, right: 5),
                      child: Text(
                        '+62',
                        style: TextStyle(
                          fontSize: 16,
                          letterSpacing: 2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    prefixIconConstraints:
                        BoxConstraints(minWidth: 0, minHeight: 40),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[100]),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[100]),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[100]),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: FlatButton(
                    onPressed: () {
                      controller.phoneSignIn();
                    },
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    color: Get.theme.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      'Kirim kode OTP',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'login pakai sosial media',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: FlatButton(
                    onPressed: () {
                      controller.googleSignIn();
                    },
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    color: Colors.grey[200],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      'Google',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: FlatButton(
                    onPressed: () {
                      controller.facebookSignIn();
                    },
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    color: Colors.blue[800],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      'Facebook',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: RichText(
                      textAlign: TextAlign.right,
                      text: TextSpan(
                        text: 'belum punya akun? daftar dulu di ',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.grey[600],
                        ),
                        children: [
                          TextSpan(
                            text: 'sini',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.toNamed(REGISTER_PAGE);
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
        ),
      ),
    );
  }
}
