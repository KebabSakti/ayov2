import 'package:ayov2/const/const.dart';
import 'package:ayov2/getx/getx.dart';
import 'package:ayov2/model/model.dart';
import 'package:get/get.dart';

class CartPageController extends GetxController {
  final CartController cartController = Get.find();

  String initialProductQty(ProductModel productModel) {
    int index = cartController.getProductIndex(productModel);

    return (index >= 0)
        ? cartController.cartItems[index].cartItemQty.toString()
        : '0';
  }

  void plus(ProductModel productModel) {
    cartController.setQty(
        productModel, int.parse(initialProductQty(productModel)) + 1);
  }

  void minus(ProductModel productModel) {
    if (int.parse(initialProductQty(productModel)) > 0)
      cartController.setQty(
          productModel, int.parse(initialProductQty(productModel)) - 1);
  }

  void delete(ProductModel productModel) {
    cartController.setQty(productModel, 0);
  }

  void setQty(ProductModel productModel, String value) {
    cartController.setQty(productModel, int.parse(value));
  }

  void routeToOrderSummaryPage() {
    Get.toNamed(ORDER_SUMMARY_PAGE);
  }

  @override
  void onInit() {
    super.onInit();
  }
}
