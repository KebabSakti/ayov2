import 'package:ayov2/helper/helper.dart';

class ErrorHandler implements Exception {
  String message;

  ErrorHandler(String message) {
    this.message = message;
  }

  void show() {
    Helper _helper = Helper();

    _helper.toast.show(this.message);
  }
}
