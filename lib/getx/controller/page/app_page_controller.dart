import 'package:ayov2/core/core.dart';
import 'package:ayov2/getx/getx.dart';
import 'package:ayov2/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppPageController extends GetxController {
  final RxInt activePage = 0.obs;

  final GlobalObs globalObs = Get.find();
  final CartController cartController = Get.find();

  final PageController pageController = PageController();
  final Cart _cart = Cart();

  final List<Widget> pages = [
    HomePage(),
    Center(
      child: Text('Souvenir'),
    ),
    CartPage(),
    Center(
      child: Text('Notif'),
    ),
    Center(
      child: Text('Voucher'),
    ),
  ];

  void _cartData() {
    _cart.cart().then((result) {
      cartController.cartItems.assignAll(result);
    });
  }

  void navigateTo(int index) {
    activePage(index);
  }

  void _init() {
    ever(activePage, (index) => pageController.jumpToPage(index));

    _cartData();
  }

  @override
  void onInit() {
    _init();
    super.onInit();
  }
}
