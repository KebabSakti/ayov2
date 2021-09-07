import 'package:ayov2/const/const.dart';
import 'package:ayov2/core/core.dart';
import 'package:ayov2/getx/getx.dart';
import 'package:ayov2/model/model.dart';
import 'package:ayov2/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

enum PanelBody { category, other }

class AppPageController extends GetxController {
  final RxInt activePage = 0.obs;
  final Rx<PanelBody> panelBody = PanelBody.category.obs;

  final GlobalObs globalObs = Get.find();
  final CartController cartController = Get.find();

  final PageController pageController = PageController();
  final PanelController panelController = PanelController();
  final Cart _cart = Cart();

  final List<Widget> pages = [
    HomePage(),
    Center(
      child: Text('Order'),
    ),
    Center(
      child: Text('Voucher'),
    ),
    Center(
      child: Text('Notif'),
    ),
    Center(
      child: Text('Akun'),
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

  void openPanel(PanelBody body) {
    panelBody(body);
    panelController.animatePanelToPosition(1.0,
        duration: Duration(milliseconds: 100));
  }

  void routeToProductPage(ProductFilterModel filter) async {
    Get.toNamed(PRODUCT_PAGE, arguments: filter);
  }

  Future<bool> backButtonHandler() async {
    if (panelController.isPanelOpen) {
      panelController.close();
    } else {
      await Get.dialog(
        AlertDialog(
          content: Text('Keluar dari aplikasi?'),
          actions: <Widget>[
            // TextButton(
            //   child: Text(
            //     'Minimize',
            //     textAlign: TextAlign.end,
            //   ),
            //   onPressed: () async {
            //     const _platform =
            //         const MethodChannel('com.ayobelanja.ayov2/default_channel');

            //     Get.back();

            //     await Future.delayed(Duration(milliseconds: 200));

            //     _platform.invokeMethod('moveTaskToBack');
            //   },
            // ),
            TextButton(
              child: Text('Batal'),
              onPressed: () {
                Get.back();
              },
            ),
            TextButton(
              child: Text('Keluar'),
              onPressed: () {
                SystemChannels.platform.invokeMethod('SystemNavigator.pop');
              },
            ),
          ],
        ),
      );
    }

    return false;
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
