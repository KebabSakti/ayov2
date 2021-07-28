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

  void _evaluateItems() {
    bool _gas = false;
    bool _sayur = false;
    bool _lain = false;
    String _message = '';

    cartItems.forEach((item) {
      if (item.product.productIsExclusive == 1 &&
          item.product.productDeliveryType == 'LANGSUNG') _gas = true;

      if (item.product.productIsExclusive == 0 &&
          item.product.productDeliveryType == 'TERJADWAL') _sayur = true;

      if (item.product.productIsExclusive == 0 &&
          item.product.productDeliveryType == 'LANGSUNG') _lain = true;
    });

    if (_gas == true && _lain == true || _gas == false && _lain == true) {
      _message = 'Pakai kurir gas kantor';
    } else if (_gas == true) {
      _message = 'Pakai kurir gas mitra';
    }

    if (_sayur == true) _message += ' Pakai kurir sayur kantor';

    print('DEBUGG : $_message');
  }

  void _init() {
    ever(cartItems, (_) {
      _calculateTotal();
      _evaluateItems();
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
