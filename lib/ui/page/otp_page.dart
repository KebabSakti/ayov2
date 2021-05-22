import 'package:ayov2/getx/getx.dart';
import 'package:ayov2/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpPage extends GetView<OtpPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.grey[800], //change your color here
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Kode Verifikasi',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Masukkan kode OTP yang telah kami kirimkan ke no hp anda.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: 40),
          Container(
            // width: 200,
            height: 70,
            margin: EdgeInsets.symmetric(horizontal: 40),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(6),
            ),
            child: Center(
              child: Obx(() {
                return Text(
                  controller.otp.value == '' ? 'XXXXXX' : controller.otp.value,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    letterSpacing: 30,
                    color: controller.otp.value == ''
                        ? Colors.grey[400]
                        : Colors.green,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                );
              }),
            ),
          ),
          SizedBox(height: 10),
          (true)
              ? GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Kirim ulang OTP',
                    style: TextStyle(
                      color: Get.theme.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              : Text(
                  '01:00',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
          SizedBox(height: 30),
          Expanded(
            child: OnScreenKeyboard(
              onPressed: (value) {
                controller.onScreenKeyboardValueListener(value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
