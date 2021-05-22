import 'package:ayov2/core/core.dart';
import 'package:ayov2/getx/getx.dart';
import 'package:ayov2/model/model.dart';
import 'package:get/get.dart';

class OnboardingPageController extends GetxController {
  final GlobalObs _globalObs = Get.find();
  final AppPreference _appPreference = Get.find();

  @override
  void onInit() async {
    await _appPreference.setOnboarding(true).then(
          (_) => _globalObs.preferences(
            Preference(onboarding: true),
          ),
        );

    super.onInit();
  }
}
