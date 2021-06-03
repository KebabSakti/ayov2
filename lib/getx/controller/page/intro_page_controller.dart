import 'package:ayov2/const/const.dart';
import 'package:ayov2/core/core.dart';
import 'package:ayov2/getx/getx.dart';
import 'package:ayov2/helper/helper.dart';
import 'package:ayov2/model/model.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class IntroPageController extends GetxController {
  final GlobalObs _globalObs = Get.find();
  final AppPreference _appPreference = Get.find();
  final AuthLocal _authLocal = Get.find();
  final AuthFirebase _authFirebase = Get.find();
  final Helper _helper = Get.find();

  final Fcm _fcm = Fcm();

  void _authState() async {
    if (await _appPreference.getOnboarding() == false) {
      _routeToOnboardingPage();
    } else {
      if (_authFirebase.instance().currentUser == null) {
        _routeToLoginPage();
      } else {
        _authenticate(_authFirebase.instance().currentUser);
      }
    }
  }

  void _authenticate(User user) async {
    try {
      CustomerModel customerModel = await _authLocal.authenticate(
        customerId: user.uid,
        customerName: user.displayName,
        customerPhone: user.phoneNumber,
        customerEmail: user.email,
        customerPassword: user.uid,
        customerFcm: await _appPreference.getFcmToken(),
      );

      await _authLocal.saveUserPreference(
          customerModel.customerId, customerModel.customerToken);

      _globalObs.customerModel(customerModel);

      _routeToAppPage();
    } on DioError {
      _helper.dialog.close();
      _helper.dialog.error(DIOERROR_MESSAGE,
          buttonText: 'Coba Lagi', dismissible: false, onPressed: () {
        _helper.dialog.close();
        _authState();
      });
    }
  }

  Future _initFirebase() async {
    await Firebase.initializeApp();
  }

  Future _initFcm() async {
    await _fcm.registerNotificationChannel();
    await _appPreference.setFcmToken(await _fcm.token());

    _fcm.handleMessageEvent(
      onMessage: (Map<String, dynamic> payload) {
        _globalObs
            .fcmModel(FcmModel(event: FcmEvent.onMessage, payload: payload));
      },
      onLaunch: (Map<String, dynamic> payload) {
        _globalObs
            .fcmModel(FcmModel(event: FcmEvent.onLaunch, payload: payload));
      },
      onResume: (Map<String, dynamic> payload) {
        _globalObs
            .fcmModel(FcmModel(event: FcmEvent.onResume, payload: payload));
      },
    );
  }

  Future _cacheSvgAssets() async {
    Future.wait([
      precachePicture(
        ExactAssetPicture(SvgPicture.svgStringDecoder, LOGO),
        null,
      ),
      precachePicture(
        ExactAssetPicture(SvgPicture.svgStringDecoder, QR_ICON),
        null,
      ),
      precachePicture(
        ExactAssetPicture(SvgPicture.svgStringDecoder, COIN_ICON),
        null,
      ),
      precachePicture(
        ExactAssetPicture(SvgPicture.svgStringDecoder, ARROW_UP_ICON),
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

  Future _init() async {
    await _initFirebase();
    await _initFcm();
    await _cacheSvgAssets();
    await _myPreference();
    _authState();
  }

  void _routeToOnboardingPage() {
    Get.offAllNamed(ONBOARDING_PAGE);
  }

  void _routeToLoginPage() {
    Get.offAllNamed(LOGIN_PAGE);
  }

  void _routeToAppPage() {
    Get.offAllNamed(APP_PAGE);
  }

  @override
  void onInit() async {
    await _init();
    super.onInit();
  }
}
