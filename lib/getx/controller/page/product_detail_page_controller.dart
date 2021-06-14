import 'package:ayov2/const/const.dart';
import 'package:ayov2/core/core.dart';
import 'package:ayov2/getx/controller/controller.dart';
import 'package:ayov2/model/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProductDetailPageControlller extends GetxController {
  final AppPage _appPage = AppPage();
  final Product _productCore = Product();

  final TextEditingController qtyField = TextEditingController();

  final RxBool loading = false.obs;
  final RxBool loadingFavourite = false.obs;
  final Rx<ProductModel> product = ProductModel().obs;

  final CartController cartController = Get.find();

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

  void plus() {
    qtyField.text = (int.parse(qtyField.text) + 1).toString();
  }

  void minus() {
    if (int.parse(qtyField.text) > 0)
      qtyField.text = (int.parse(qtyField.text) - 1).toString();
  }

  void _qtyFieldListener() {
    print('CART : QTY FIELD LISTENER ${qtyField.text}');
    cartController.setQty(product.value, int.parse(qtyField.text));
  }

  void _init() {
    loadPageData();

    int index = cartController.getProductIndex(productModel);

    print('CART : DETAIL PAGE INDEX $index');

    if (index >= 0) {
      qtyField.text = cartController.cartItems[index].cartItemQty.toString();
    } else {
      qtyField.text = '0';
    }

    qtyField.addListener(_qtyFieldListener);
  }

  @override
  void onInit() {
    _init();
    super.onInit();
  }
}
