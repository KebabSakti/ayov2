import 'package:ayov2/getx/getx.dart';
import 'package:get/get.dart';

class IntroPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(IntroPageController());
  }
}
