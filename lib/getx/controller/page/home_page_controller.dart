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

  final RxBool loading = true.obs;
  final RxBool loadingPagination = false.obs;
  final RxBool loadingFilter = false.obs;
  final Rx<ProductPaginateModel> productPaginate = ProductPaginateModel().obs;
  final Rx<ProductFilterModel> filterModel = ProductFilterModel().obs;

  final AppPage _appPage = AppPage();
  final Product _product = Product();
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

  void _loadFilteredProduct() async {
    loadingFilter(true);

    await _product
        .product(
      "?page=1",
      highSell: filterModel.value.palingLaris,
      discount: filterModel.value.lagiDiskon,
      highRatingValue: filterModel.value.ratingEmpat,
      highPoint: filterModel.value.banyakCoin,
    )
        .then((model) {
      productPaginate(model);

      loadingFilter(false);
    });
  }

  void _loadMoreProduct(double offset, double maxScroll) async {
    bool fetch = ((offset == maxScroll) &&
        !loadingPagination.value &&
        !loadingFilter.value &&
        productPaginate.value.pagination.nextPageUrl != null);

    if (fetch) {
      loadingPagination(true);

      await _product
          .product(
        "?page=${productPaginate.value.pagination.currentPage + 1}",
        highSell: filterModel.value.palingLaris,
        discount: filterModel.value.lagiDiskon,
        highRatingValue: filterModel.value.ratingEmpat,
        highPoint: filterModel.value.banyakCoin,
      )
          .then((model) {
        ProductPaginateModel productPaginateModel = ProductPaginateModel(
          pagination: model.pagination,
          products: productPaginate.value.products + model.products,
        );

        productPaginate(productPaginateModel);

        loadingPagination(false);
      });
    }
  }

  void _scrollListener() {
    double offset = homePageScrollController.offset;
    double maxScroll = homePageScrollController.position.maxScrollExtent;

    //product pagination
    _loadMoreProduct(offset, maxScroll);
  }

  void _homeData() async {
    try {
      loading(true);

      await _appPage.home().then((model) {
        homePageModel = model;

        productPaginate(model.productPaginateModel);

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

  void _routeToLoginPage() {
    Get.offAllNamed(LOGIN_PAGE);
  }

  void init() async {
    homePageScrollController.addListener(_scrollListener);

    debounce(filterModel, (_) {
      _loadFilteredProduct();
    }, time: Duration(milliseconds: 500));

    _homeData();
  }

  @override
  void onInit() {
    init();

    super.onInit();
  }

  @override
  void onClose() {
    homePageScrollController.dispose();
    super.onClose();
  }
}
