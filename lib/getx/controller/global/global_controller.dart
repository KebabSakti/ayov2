import 'package:ayov2/core/core.dart';
import 'package:ayov2/getx/getx.dart';
import 'package:ayov2/model/fcm/fcm_model.dart';
import 'package:get/get.dart';

class GlobalController extends GetxController {
  final GlobalObs _globalObs = Get.find();
  final AppPreference _appPreference = Get.find();

  final Fcm _fcm = Fcm();

  Future _fcmInit() async {
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

  void _init() async {
    await _fcmInit();
  }

  @override
  void onInit() {
    _init();
    super.onInit();
  }
}
