import 'package:intl/intl.dart';

class HumanFormats {
  static String convertNumber(int number) {
    final formattedNumber = NumberFormat('#,##0', 'es_ES').format(number);
    return formattedNumber;
  }

  static String listToString(List<String> items) {
    return '${items.take(items.length - 1).join(', ')}${items.length > 1 ? ', ' : ''}${items.last}.';
  }
}
