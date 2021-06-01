import 'package:ayov2/const/const.dart';
import 'package:ayov2/core/core.dart';
import 'package:ayov2/getx/getx.dart';
import 'package:ayov2/helper/helper.dart';
import 'package:ayov2/model/model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  final AuthFirebase _authFirebase = Get.find();
  final AuthLocal _authLocal = Get.find();
  final Helper _helper = Get.find();
  final GlobalObs _globalObs = Get.find();
  final AppPage _appPage = AppPage();
  final RxBool loading = true.obs;
  final ScrollController homePageScrollController = ScrollController();

  HomePageModel homePageModel = HomePageModel();

  void signOutButton() async {
    try {
      _helper.dialog.loading();

      await _authLocal.signout(_globalObs.customerModel.value.customerId);
      await _authLocal.clearUserPreference();
      await _authFirebase.signOut();

      _routeToLoginPage();
    } catch (e) {
      _helper.dialog.close();
      _helper.dialog.error(e.toString(), dismissible: true);
    }
  }

  void _routeToLoginPage() {
    Get.offAllNamed(LOGIN_PAGE);
  }

  void _homeData() async {
    try {
      loading(true);

      await _appPage.home().then((model) {
        homePageModel = model;

        loading(false);
      });
    } on DioError {
      _helper.dialog.error(DIOERROR_MESSAGE,
          buttonText: 'Coba Lagi', dismissible: false, onPressed: () {
        _helper.dialog.close();
        _homeData();
      });
    }
  }

  void init() async {
    _homeData();
  }

  @override
  void onInit() {
    init();
    super.onInit();
  }
}
