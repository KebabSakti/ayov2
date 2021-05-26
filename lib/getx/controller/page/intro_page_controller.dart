import 'package:ayov2/const/const.dart';
import 'package:ayov2/core/core.dart';
import 'package:ayov2/getx/getx.dart';
import 'package:ayov2/model/model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class IntroPageController extends GetxController {
  final GlobalObs _globalObs = Get.find();
  final AppPreference _appPreference = Get.find();

  Future _initFirebase() async {
    await Firebase.initializeApp();
  }

  Future _cacheAssets() async {
    Future.wait([
      precachePicture(
        ExactAssetPicture(SvgPicture.svgStringDecoder, LOGO),
        null,
      ),
    ]);
  }

  Future _myPreference() async {
    _globalObs.preferences(
      Preference(
        onboarding: await _appPreference.getOnboarding(),
      ),
    );
  }

  Future _authState() async {
    FirebaseAuth auth = FirebaseAuth.instance;

    if (await _appPreference.getOnboarding() == false) {
      Get.offAllNamed(ONBOARDING_PAGE);
    } else {
      if (auth.currentUser != null) {
        Get.offAllNamed(HOME_PAGE);
      } else {
        Get.offAllNamed(LOGIN_PAGE);
      }
    }
  }

  Future _init() async {
    await _initFirebase();
    await _cacheAssets();
    await _myPreference();
    await _authState();
  }

  @override
  void onInit() async {
    await _init();
    super.onInit();
  }
}
