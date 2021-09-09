import 'package:ayov2/model/model.dart';
import 'package:get/get.dart';

class ProductFilterPageController extends GetxController {
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
    productTag: Get.arguments.productTag,
    productBundleId: Get.arguments.productBundleId,
  ).obs;

  void back() {
    Get.back(result: filterModel.value);
  }
}
