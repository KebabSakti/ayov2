import 'package:ayov2/const/const.dart';
import 'package:ayov2/core/core.dart';
import 'package:ayov2/model/model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductPageController extends GetxController {
  final RxBool loadingFilter = false.obs;
  final RxBool loadingPagination = false.obs;
  final Rx<ProductPaginateModel> productPaginate = ProductPaginateModel().obs;
  final Rx<ProductFilterModel> filterModel = ProductFilterModel(
    category: Get.arguments.category,
    deliveryType: Get.arguments.deliveryType,
    discount: Get.arguments.discount,
    highPoint: Get.arguments.highPoint,
    highRatingCount: Get.arguments.highRatingCount,
    highRatingValue: Get.arguments.highRatingValue,
    highSearch: Get.arguments.highSearch,
    highSell: Get.arguments.highSell,
    highView: Get.arguments.highView,
    keyword: Get.arguments.keyword,
    productId: Get.arguments.productId,
    productPrice: Get.arguments.productPrice,
    subCategory: Get.arguments.subCategory,
  ).obs;

  final Product _product = Product();
  final ScrollController scrollController = ScrollController();

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

  void loadFilteredProduct() async {
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
    double offset = scrollController.offset;
    double maxScroll = scrollController.position.maxScrollExtent;

    //product pagination
    _loadMoreProduct(offset, maxScroll);
  }

  void routeToSearchPage() {
    Get.toNamed(SEARCH_PAGE, arguments: filterModel.value.keyword ?? '');
  }

  void routeToFilterPage() async {
    var result =
        await Get.toNamed(PRODUCT_FILTER_PAGE, arguments: filterModel.value);

    if (result != null) filterModel(result);
  }

  void _init() {
    scrollController.addListener(_scrollListener);

    debounce(filterModel, (_) {
      loadFilteredProduct();
    }, time: Duration(milliseconds: 500));

    filterModel(Get.arguments);
  }

  @override
  void onInit() {
    _init();
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
