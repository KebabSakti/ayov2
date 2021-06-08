import 'package:ayov2/model/model.dart';
import 'package:get/get.dart';

class ProductFilterPageController extends GetxController {
  // final Product _product = Product();

  // final RxBool loading = false.obs;
  final RxList<ProductModel> products = List<ProductModel>().obs;
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

  // void _loadProductTotal() async {
  //   loading(true);

  //   await _product
  //       .productTotal(
  //     category: filterModel.value.category,
  //     deliveryType: filterModel.value.deliveryType,
  //     discount: filterModel.value.discount,
  //     highPoint: filterModel.value.highPoint,
  //     highRatingCount: filterModel.value.highRatingCount,
  //     highRatingValue: filterModel.value.highRatingValue,
  //     highSearch: filterModel.value.highSearch,
  //     highSell: filterModel.value.highSell,
  //     highView: filterModel.value.highView,
  //     keyword: filterModel.value.keyword,
  //     productId: filterModel.value.productId,
  //     productPrice: filterModel.value.productPrice,
  //     subCategory: filterModel.value.subCategory,
  //   )
  //       .then((model) {
  //     products(model);

  //     loading(false);
  //   });
  // }

  void back() {
    Get.back(result: filterModel.value);
  }

  @override
  void onInit() {
    // debounce(filterModel, (_) {
    //   _loadProductTotal();
    // }, time: Duration(milliseconds: 500));
    super.onInit();
  }
}
