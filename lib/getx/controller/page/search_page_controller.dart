import 'package:ayov2/core/core.dart';
import 'package:ayov2/model/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SearchPageController extends GetxController {
  final AppPage _appPage = AppPage();
  final TextEditingController searchField = TextEditingController();

  final RxBool loading = false.obs;
  final RxBool loadingPage = false.obs;
  final RxString keyword = ''.obs;

  SearchPageModel searchPageModel = SearchPageModel();

  void loadPageData() async {
    loadingPage(true);

    await _appPage.search().then((model) {
      searchPageModel = model;

      loadingPage(false);
    });
  }

  void _init() {
    loadPageData();
  }

  @override
  void onInit() {
    _init();
    super.onInit();
  }

  @override
  void onClose() {
    searchField.dispose();
    super.onClose();
  }
}
