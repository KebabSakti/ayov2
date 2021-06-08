import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScannerPageController extends GetxController {
  final GlobalKey key = GlobalKey(debugLabel: 'QR');

  QRViewController controller;

  void onQrViewCreated(QRViewController qrViewController) {
    controller = qrViewController;
    controller.scannedDataStream.listen((scanData) {
      back(scanData.code);
    });
  }

  void back(String value) {
    Get.back(result: value);
  }

  @override
  void onClose() {
    controller?.dispose();
    super.onClose();
  }
}
