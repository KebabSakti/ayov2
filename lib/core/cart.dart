import 'package:ayov2/getx/getx.dart';
import 'package:ayov2/model/model.dart';
import 'package:get/get.dart';

class Cart {
  final GlobalObs _globalObs = Get.find();

  void setCart(List<CartItemModel> items) {
    _globalObs.cartItems.assignAll(items);
  }

  void addQty(CartItemModel item) {
    _globalObs.cartItems.add(item);
  }

  int getCartQty() {
    int total =
        _globalObs.cartItems.fold(0, (sum, item) => sum + item.cartItemQty);

    return total;
  }

  double getCartPriceTotal() {
    double total = _globalObs.cartItems.fold(
        0,
        (sum, item) =>
            sum + double.parse((item.cartItemPrice * item.cartItemQty)));

    return total;
  }
}
