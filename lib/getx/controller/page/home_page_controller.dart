import 'package:ayov2/const/const.dart';
import 'package:ayov2/core/core.dart';
import 'package:ayov2/helper/helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  final AuthFirebase firebaseAuth = Get.find();
  final Helper _helper = Get.find();

  Future<UserCredential> linkToFacebookAuth() async {
    final FirebaseAuth firebaseAuthInstance = FirebaseAuth.instance;

    OAuthCredential facebookCredential =
        await firebaseAuth.facebookCredential();

    return await firebaseAuth.linkCredential(
        firebaseAuthInstance.currentUser, facebookCredential);
  }

  void signOutButton() async {
    _helper.dialog.loading();
    await Future.delayed(Duration(seconds: 5));
    await firebaseAuth.signOut().then((_) => Get.offAllNamed(LOGIN_PAGE));
  }
}
