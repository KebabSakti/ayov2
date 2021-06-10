import 'package:ayov2/model/model.dart';
import 'package:get/get.dart';

class CategoryPageContrller extends GetxController {
  final RxBool loading = false.obs;
  final RxString active = ''.obs;
  final Rx<CategoryPageModel> categoryPageModel = CategoryPageModel().obs;

  void _init() {
    categoryPageModel(Get.arguments);
    active(categoryPageModel.value.categories.first.categoryId);
  }

  @override
  void onInit() {
    _init();
    super.onInit();
  }
}
