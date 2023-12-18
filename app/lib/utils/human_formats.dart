import 'package:intl/intl.dart';

class HumanFormats {
  static String convertNumber(int number) {
    final formattedNumber = NumberFormat('#,##0', 'es_ES').format(number);
    return formattedNumber;
  }
}
