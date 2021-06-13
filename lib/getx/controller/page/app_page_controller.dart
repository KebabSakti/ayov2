import 'package:ayov2/core/core.dart';
import 'package:ayov2/getx/getx.dart';
import 'package:ayov2/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppPageController extends GetxController {
  final RxInt activePage = 0.obs;

  final GlobalObs globalObs = Get.find();

  final PageController pageController = PageController();
  final Cart cart = Cart();

  final List<Widget> pages = [
    HomePage(),
    Center(
      child: Text('Souvenir'),
    ),
    Center(
      child: Text('Pesanan'),
    ),
    Center(
      child: Text('Notif'),
    ),
    Center(
      child: Text('Voucher'),
    ),
  ];

  void navigateTo(int index) {
    activePage(index);
  }

  @override
  void onInit() {
    ever(activePage, (index) => pageController.jumpToPage(index));
    super.onInit();
  }
}
