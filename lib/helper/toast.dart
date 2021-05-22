import 'package:fluttertoast/fluttertoast.dart';

class AyoToast {
  void show(
    String message, {
    ToastGravity position = ToastGravity.BOTTOM,
    Toast length = Toast.LENGTH_SHORT,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: length,
      gravity: position,
    );
  }
}
