import 'package:ayov2/model/cart/cart_item_model.dart';
import 'package:ayov2/model/model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final RxList<CartItemModel> cartItems = <CartItemModel>[].obs;
  final RxInt cartQtyTotal = 0.obs;
  final RxDouble cartPriceTotal = 0.0.obs;

  void plus(ProductModel product) {
    int index =
        cartItems.indexWhere((model) => model.productId == product.productId);
    if (index >= 0) {
      int qty = cartItems[index].cartItemQty + 1;
      cartItems[index] = cartItems[index].copyWith(cartItemQty: qty);
    } else {
      cartItems.add(CartItemModel(
        productId: product.productId,
        cartItemPrice: product.productPrice,
        cartItemQty: 1,
        product: product,
      ));
    }
  }

  void minus(ProductModel product) {
    int index =
        cartItems.indexWhere((model) => model.productId == product.productId);
    if (index >= 0) {
      int qty = cartItems[index].cartItemQty - 1;
      if (qty > 0) {
        cartItems[index] = cartItems[index].copyWith(cartItemQty: qty);
      } else {
        cartItems.assignAll(cartItems
            .where((model) => model.productId != product.productId)
            .toList());
      }
    }
  }

  void setQty(ProductModel product, int qty) {
    int index = getProductIndex(product);

    print('CART : CART CONTROLLER INDEX $index');

    print('CART : QTY IS $qty');

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
          cartItemQty: 1,
          product: product,
        ));
      }
    } else {
      if (index >= 0) {
        cartItems.assignAll(cartItems
            .where((model) => model.productId != product.productId)
            .toList());
      }
    }
  }

  int getProductIndex(ProductModel product) {
    return cartItems
        .indexWhere((model) => model.productId == product.productId);
  }

  void _updateCart() {}

  void _calculateTotal() {
    //qty total
    cartQtyTotal(cartItems.fold(0, (sum, item) => sum + item.cartItemQty));

    //price total
    cartPriceTotal(cartItems.fold(
        0, (sum, item) => sum + double.parse((item.cartItemPrice))));
  }

  void _init() {
    ever(cartItems, (_) {
      print('CART : CART ITEM COUNT ${cartItems.length}');

      cartItems.forEach((item) {
        print('CART : ' + item.productId);
      });

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
