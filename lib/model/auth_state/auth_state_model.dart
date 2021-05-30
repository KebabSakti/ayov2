import 'package:firebase_auth/firebase_auth.dart';

class AuthStateModel {
  bool state;
  User user;

  AuthStateModel({this.state = false, this.user});
}
