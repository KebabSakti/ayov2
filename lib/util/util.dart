import 'package:intl/intl.dart';

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
}
