import 'package:ayov2/getx/controller/controller.dart';
import 'package:get/get.dart';

class AppPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AppPageController());
  }
}
