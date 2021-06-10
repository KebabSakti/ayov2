import 'package:ayov2/getx/getx.dart';
import 'package:get/get.dart';

class ProductDetailPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.create(() => ProductDetailPageControlller());
  }
}
