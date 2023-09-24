import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  static String toFormattedEEEE(DateTime date) {
    return DateFormat('EEEE', 'ES').format(date).toUpperCase();
  }

  static String toFormattedyyyyMMdd(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  static String toFormattedEEEEdeMMMMdelyyyy(DateTime date) {
    return DateFormat('EEEE d \'de\' MMMM \'del\' yyyy', 'ES').format(date);
  }

  static DateTime toFormatDateTime(String value) {
    return DateTime.parse(value);
  }

  static bool isEquealDate(DateTime date, DateTime date2) {
    if (date.day == date2.day &&
        date.month == date2.month &&
        date.year == date2.year) {
      return true;
    }
    return false;
  }
}
