import 'package:ayov2/getx/getx.dart';
import 'package:get/get.dart';

class MapPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MapPageController());
  }
}
