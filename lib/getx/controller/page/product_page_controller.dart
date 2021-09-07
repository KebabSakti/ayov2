import 'package:ayov2/const/const.dart';
import 'package:ayov2/core/core.dart';
import 'package:ayov2/model/model.dart';
import 'package:ayov2/util/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductPageController extends GetxController {
  final Rx<ProductFilterModel> filterModel = ProductFilterModel().obs;

  final Rx<StateModel<ProductPaginateModel>> pageState =
      StateModel<ProductPaginateModel>(
    state: States.loading,
    data: ProductPaginateModel(),
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
      productTag: filterModel.value.productTag,
      productBundleId: filterModel.value.productBundleId,
    );
  }

  void loadFilteredProduct() async {
    try {
      pageState(StateModel(state: States.loading));

      await _loadProduct("?page=1").then((model) {
        pageState(
          StateModel(
            data: model,
            state:
                (model.products.length == 0) ? States.empty : States.complete,
          ),
        );
      }).catchError((e, k) => throw Failure(DIOERROR_MESSAGE));
    } on Failure catch (_) {
      pageState(StateModel(state: States.error));
    }
  }

  void _loadMoreProduct(double offset, double maxScroll) async {
    try {
      bool fetch = ((offset == maxScroll) &&
          pageState().state == States.complete &&
          pageState().data.products.length > 0 &&
          pageState().data.pagination.nextPageUrl != null);

      if (fetch) {
        pageState(pageState().copyWith(state: States.paging));

        await _loadProduct(
                "?page=${pageState().data.pagination.currentPage + 1}")
            .then((model) {
          ProductPaginateModel productPaginateModel = ProductPaginateModel(
            pagination: model.pagination,
            products: pageState().data.products + model.products,
          );

          pageState(
            StateModel(
              data: productPaginateModel,
              state: States.complete,
            ),
          );
        }).catchError((e, k) => throw Failure(DIOERROR_MESSAGE));
      }
    } on Failure catch (_) {
      pageState(StateModel(state: States.error));
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

  void routeToProductDetailPage(ProductModel product) async {
    Get.toNamed(PRODUCT_DETAIL_PAGE, arguments: product);
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
    // scrollController.dispose();
    super.onClose();
  }
}
