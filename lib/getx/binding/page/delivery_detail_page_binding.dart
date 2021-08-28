import 'package:ayov2/getx/controller/page/delivery_detail_page_controller.dart';
import 'package:get/get.dart';

class DeliveryDetailPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DeliveryDetailPageController());
  }
}
