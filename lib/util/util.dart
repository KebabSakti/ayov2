import 'package:intl/intl.dart';
import 'dart:math';

class Utility {
  String currency(
    String value, {
    String locale = 'id_ID',
    String name = 'Rp ',
    int digit = 0,
  }) {
    NumberFormat numberFormat = NumberFormat.currency(
      locale: locale,
      name: name,
      decimalDigits: digit,
    );

    return numberFormat.format(double.parse(value));
  }

  String randomString(int length) {
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';

    Random _rnd = Random();

    return String.fromCharCodes(Iterable.generate(
        length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
  }
}
