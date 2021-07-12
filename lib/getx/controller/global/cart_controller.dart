import 'package:ayov2/core/core.dart';
import 'package:ayov2/model/model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final RxList<CartItemModel> cartItems = List<CartItemModel>().obs;
  final RxInt cartQtyTotal = 0.obs;
  final RxDouble cartPriceTotal = 0.0.obs;

  final Cart _cart = Cart();

  void setQty(ProductModel product, int qty) {
    int index = getProductIndex(product);

    if (qty > 0) {
      if (index >= 0) {
        cartItems[index] = cartItems[index].copyWith(
          cartItemQty: qty,
          cartItemPrice:
              (qty * double.parse(product.productFinalPrice)).toString(),
        );
      } else {
        cartItems.add(CartItemModel(
          productId: product.productId,
          cartItemPrice: product.productFinalPrice,
          cartItemQty: qty,
          product: product,
        ));
      }
    } else {
      cartItems.assignAll(cartItems
          .where((model) => model.product.productId != product.productId)
          .toList());
    }
  }

  int getProductIndex(ProductModel product) {
    return cartItems
        .indexWhere((model) => model.product.productId == product.productId);
  }

  void _calculateTotal() {
    //qty total
    cartQtyTotal(cartItems.fold(0, (sum, item) => sum + item.cartItemQty));

    //price total
    cartPriceTotal(cartItems.fold(
        0, (sum, item) => sum + double.parse(item.cartItemPrice)));
  }

  void _updateCart() {
    _cart.cartUpdate(cartItems: cartItems);
  }

  void _init() {
    ever(cartItems, (_) {
      _calculateTotal();
    });

    debounce(cartItems, (_) {
      _updateCart();
    }, time: Duration(seconds: 1));
  }

  @override
  void onInit() {
    _init();
    super.onInit();
  }
}
