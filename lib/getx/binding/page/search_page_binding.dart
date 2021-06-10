import 'package:ayov2/getx/getx.dart';
import 'package:get/get.dart';

class SearchPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.create(() => SearchPageController());
  }
}
