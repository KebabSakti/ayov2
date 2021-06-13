import 'package:ayov2/const/const.dart';
import 'package:ayov2/core/core.dart';
import 'package:ayov2/model/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProductDetailPageControlller extends GetxController {
  final AppPage _appPage = AppPage();
  final Product _productCore = Product();
  final TextEditingController qtyField = TextEditingController();
  final Cart cart = Cart();

  final RxBool loading = false.obs;
  final RxBool loadingFavourite = false.obs;
  final Rx<ProductModel> product = ProductModel().obs;

  ProductModel productModel = Get.arguments;
  ProductDetailPageModel pageModel = ProductDetailPageModel();

  void loadPageData() async {
    loading(true);

    await _appPage.product(productId: productModel.productId).then((model) {
      pageModel = model;

      product(model.product);

      loading(false);
    });
  }

  void addProductFavourite(String productId) async {
    loadingFavourite(true);

    await _productCore.favourite(productId: productId).then((model) {
      product(model);

      loadingFavourite(false);
    });
  }

  void routeToProductDetailPage(ProductModel product) async {
    Get.toNamed(PRODUCT_DETAIL_PAGE,
        arguments: product, preventDuplicates: false);
  }

  void _init() {
    loadPageData();

    qtyField.text = '0';
  }

  @override
  void onInit() {
    _init();
    super.onInit();
  }
}
