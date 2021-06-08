import 'package:ayov2/const/const.dart';
import 'package:ayov2/getx/getx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScannerPage extends GetView<QrScannerPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          QRView(
            key: controller.key,
            onQRViewCreated: controller.onQrViewCreated,
          ),
          Align(
            alignment: Alignment.center,
            child: Lottie.asset(QR_SCAN_ANIMATION),
          ),
        ],
      ),
    );
  }
}
