import 'package:ayov2/getx/getx.dart';
import 'package:get/get.dart';

class CartPageController extends GetxController {
  final CartController cartController = Get.find();

  @override
  void onInit() {
    print('Keranjang belanja');
    super.onInit();
  }
}
