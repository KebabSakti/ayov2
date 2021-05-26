import 'package:ayov2/const/const.dart';
import 'package:ayov2/core/core.dart';
import 'package:ayov2/getx/getx.dart';
import 'package:ayov2/helper/helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  final AuthFirebase _authFirebase = Get.find();
  final AuthLocal _authLocal = Get.find();
  final Helper _helper = Get.find();
  final GlobalObs _globalObs = Get.find();

  Future<UserCredential> linkToFacebookAuth() async {
    final FirebaseAuth firebaseAuthInstance = FirebaseAuth.instance;

    OAuthCredential facebookCredential =
        await _authFirebase.facebookCredential();

    return await _authFirebase.linkCredential(
        firebaseAuthInstance.currentUser, facebookCredential);
  }

  void signOutButton() async {
    try {
      _helper.dialog.loading();
      await Future.delayed(Duration(seconds: 5));
      await _authLocal.signout(_globalObs.customerModel.value.customerId);
      await _authFirebase.signOut();

      _routeToLoginPage();
    } catch (e) {
      _helper.dialog.close();
      _helper.dialog.error(e.toString(), dismissible: true);
    }
  }

  void _routeToLoginPage() {
    Get.offAllNamed(LOGIN_PAGE);
  }
}
