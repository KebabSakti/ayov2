import 'package:ayov2/getx/getx.dart';
import 'package:get/get.dart';

class OrderSummaryPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(OrderSummaryPageController());
  }
}
