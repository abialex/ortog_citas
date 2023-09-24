import 'package:intl/intl.dart';

extension StringExtensions on String {
  static String toFormatString(dynamic result) {
    String mensaje = result.keys.map((key) {
      List<String> messages = result[key].cast<String>();
      String formattedMessages =
          messages.map((message) => '-  $message').join('\n');
      String atrib = '$key'.toUpperCase();
      return '$atrib:\n$formattedMessages';
    }).join('\n\n');
    return mensaje;
  }
}
