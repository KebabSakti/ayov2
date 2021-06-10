import 'package:ayov2/const/const.dart';
import 'package:ayov2/core/core.dart';
import 'package:ayov2/model/model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPageController extends GetxController {
  final AppPage _appPage = AppPage();
  final Search _searchCore = Search();
  final TextEditingController searchField = TextEditingController();

  final RxBool loading = false.obs;
  final RxBool loadingPage = false.obs;
  final RxString keyword = ''.obs;
  final Rx<SearchResultModel> searchResultModel = SearchResultModel().obs;
  final Rx<SearchPageModel> searchPageModel = SearchPageModel().obs;

  void loadPageData() async {
    loadingPage(true);

    await _appPage.search().then((model) {
      searchPageModel(model);

      loadingPage(false);
    });
  }

  void searchFieldListener() {
    keyword(searchField.text);
  }

  void clearSearchField() {
    if (keyword.value.length > 0) searchField.text = '';
  }

  void _search() async {
    loading(true);

    await _searchCore.search(keyword: keyword.value).then((model) {
      searchResultModel(model);

      loading(false);
    });
  }

  void routeToProductPage(ProductFilterModel filter) async {
    Get.toNamed(PRODUCT_PAGE, arguments: filter);
  }

  void _init() {
    debounce(keyword, (_) {
      if (keyword.value.length > 0)
        _search();
      else
        searchResultModel(SearchResultModel());
    }, time: Duration(milliseconds: 500));

    searchField.addListener(searchFieldListener);

    loadPageData();

    searchField.text = Get.arguments;
  }

  @override
  void onInit() {
    _init();
    super.onInit();
  }

  @override
  void onClose() {
    // searchField.dispose();
    super.onClose();
  }
}
