import 'package:ayov2/const/const.dart';
import 'package:ayov2/core/core.dart';
import 'package:ayov2/getx/getx.dart';
import 'package:ayov2/helper/helper.dart';
import 'package:ayov2/model/model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class HomePageController extends GetxController {
  final AuthFirebase _authFirebase = Get.find();
  final AuthLocal _authLocal = Get.find();
  final Helper _helper = Get.find();
  final GlobalObs _globalObs = Get.find();
  final AppPageController appPageController = Get.find();

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

  void qrScanner() async {
    if (!await Permission.camera.isGranted) {
      _helper.dialog.show(
        'Aplikasi memerlukan izin kamera untuk melanjutkan',
        buttonText: 'Lanjutkan',
        headingText: "PERHATIAN",
        color: Colors.amber[600],
        headingIcon: Icons.warning_amber_rounded,
        dismissible: true,
        onPressed: () async {
          _helper.dialog.close();
          await Permission.camera.request().then((status) {
            _routeToQrPage();
          });
        },
      );
    } else {
      _routeToQrPage();
    }
  }

  Future<ProductPaginateModel> _loadProduct(String urlQuery) async {
    return await _product.product(
      urlQuery,
      category: filterModel.value.category,
      deliveryType: filterModel.value.deliveryType,
      discount: filterModel.value.discount,
      highPoint: filterModel.value.highPoint,
      highRatingCount: filterModel.value.highRatingCount,
      highRatingValue: filterModel.value.highRatingValue,
      highSearch: filterModel.value.highSearch,
      highSell: filterModel.value.highSell,
      highView: filterModel.value.highView,
      keyword: filterModel.value.keyword,
      productId: filterModel.value.productId,
      productPrice: filterModel.value.productPrice,
      subCategory: filterModel.value.subCategory,
    );
  }

  void _loadFilteredProduct() async {
    loadingFilter(true);

    await _loadProduct("?page=1").then((model) {
      productPaginate(model);

      loadingFilter(false);
    });
  }

  void _loadMoreProduct(double offset, double maxScroll) async {
    bool fetch = ((offset == maxScroll) &&
        !loadingPagination.value &&
        !loadingFilter.value &&
        !loading.value &&
        productPaginate.value.pagination.nextPageUrl != null);

    if (fetch) {
      loadingPagination(true);

      await _loadProduct(
              "?page=${productPaginate.value.pagination.currentPage + 1}")
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

  Future homeData() async {
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
        homeData();
      });
    }
  }

  void refresh() async {
    await homeData();

    filterModel(ProductFilterModel());
  }

  void _routeToQrPage() async {
    var result = await Get.toNamed(QR_PAGE);

    if (result != null) _helper.toast.show(result);
  }

  void routeToCategoryPage() {
    Get.toNamed(
      CATEGORY_PAGE,
      arguments: CategoryPageModel(
        categories: homePageModel.categoryModel,
        subCategories: homePageModel.subCategoryModel,
      ),
    );
  }

  void routeToCategoryDetailPage(CategoryModel category) {
    Get.toNamed(
      CATEGORY_DETAIL_PAGE,
      arguments: CategoryDetailPageModel(
        bannerSecondaries: homePageModel.bannerSecondaryModel,
        category: category,
        subCategories: homePageModel.subCategoryModel,
      ),
    );
  }

  void routeToSearchPage() {
    Get.toNamed(SEARCH_PAGE, arguments: '');
  }

  void routeToFilterPage() async {
    var result =
        await Get.toNamed(PRODUCT_FILTER_PAGE, arguments: filterModel.value);

    if (result != null) filterModel(result);
  }

  void routeToProductPage(ProductFilterModel filter) async {
    Get.toNamed(PRODUCT_PAGE, arguments: filter);
  }

  void routeToProductDetailPage(ProductModel product) async {
    Get.toNamed(PRODUCT_DETAIL_PAGE, arguments: product);
  }

  void _routeToLoginPage() {
    Get.offAllNamed(LOGIN_PAGE);
  }

  void init() async {
    homePageScrollController.addListener(_scrollListener);

    debounce(filterModel, (_) {
      _loadFilteredProduct();
    }, time: Duration(milliseconds: 500));

    homeData();
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
