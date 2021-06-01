import 'package:ayov2/getx/getx.dart';
import 'package:ayov2/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class AppPage extends GetView<AppPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller.pageController,
        children: controller.pages,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: Obx(
        () {
          return BottomNavigationBar(
            backgroundColor: Colors.white,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Get.theme.primaryColor,
            selectedFontSize: 12,
            unselectedFontSize: 10,
            selectedIconTheme: IconThemeData(size: 30),
            currentIndex: controller.activePage.value,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.shopify),
                label: 'Belanja',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.assistant_rounded),
                label: 'Souvenir',
              ),
              BottomNavigationBarItem(
                icon: IconWithDot(
                  icon: Icon(Icons.assignment_rounded),
                  showDot: true,
                ),
                label: 'Pesanan',
              ),
              BottomNavigationBarItem(
                icon: IconWithDot(
                  icon: Icon(Icons.notifications_rounded),
                  showDot: true,
                ),
                label: 'Notif',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.ballot_rounded),
                label: 'Voucher',
              ),
            ],
            onTap: controller.navigateTo,
          );
        },
      ),
    );
  }
}
