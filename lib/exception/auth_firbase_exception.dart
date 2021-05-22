import 'package:ayov2/helper/dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthFirebaseException implements Exception {
  final AyoDialog _dialog = AyoDialog();

  FirebaseAuthException exception;

  AuthFirebaseException(this.exception);

  @override
  String toString() {
    _dialog.error(this.exception.message, dismissible: true);
    return super.toString();
  }
}
