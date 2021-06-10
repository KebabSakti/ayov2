import 'package:ayov2/const/const.dart';
import 'package:ayov2/core/core.dart';
import 'package:ayov2/model/model.dart';
import 'package:get/get.dart';

class ProductDetailPageControlller extends GetxController {
  final AppPage _appPage = AppPage();

  final RxBool loading = false.obs;

  ProductModel productModel = Get.arguments;
  ProductDetailPageModel pageModel = ProductDetailPageModel();

  void loadPageData() async {
    loading(true);

    await _appPage.product(productId: productModel.productId).then((model) {
      pageModel = model;

      loading(false);
    });
  }

  void routeToProductDetailPage(ProductModel product) async {
    Get.toNamed(PRODUCT_DETAIL_PAGE,
        arguments: product, preventDuplicates: false);
  }

  void _init() {
    loadPageData();
  }

  @override
  void onInit() {
    _init();
    super.onInit();
  }
}
