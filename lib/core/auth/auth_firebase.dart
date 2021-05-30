import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthFirebase {
  Future<OAuthCredential> facebookCredential() async {
    final LoginResult result = await FacebookAuth.instance
        .login(loginBehavior: LoginBehavior.NATIVE_WITH_FALLBACK);

    return FacebookAuthProvider.credential(result.accessToken.token);
  }

  Future<OAuthCredential> googleCredential() async {
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    if (googleUser == null) return null;

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    return GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
  }

  PhoneAuthCredential phoneCredential(String verificationId, String otpCode) {
    return PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: otpCode);
  }

  Future signInWithPhone(
    String phoneNumber, {
    @required Function verificationCompleted,
    @required Function codeAutoRetrievalTimeout,
    @required Function codeSent,
    @required Function verificationFailed,
    int forceResendingToken,
  }) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: verificationCompleted,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
      codeSent: codeSent,
      verificationFailed: verificationFailed,
      forceResendingToken: forceResendingToken,
    );
  }

  Future<UserCredential> signInWithCredential(dynamic credential) async {
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<UserCredential> linkCredential(
      User user, OAuthCredential credential) async {
    return await user.linkWithCredential(credential);
  }

  Future signOut() async {
    await FacebookAuth.instance.logOut();
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
  }
}
