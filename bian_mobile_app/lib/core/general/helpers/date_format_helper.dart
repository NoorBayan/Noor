import 'package:intl/intl.dart';

class DateFormatHelper {
  static String format(DateTime date, String pattern, [String? local]) {
    String? currentLocal = local;
    // if (local == null) currentLocal = AppProvider().getLanguageCode;
    final formatter = DateFormat(pattern, currentLocal);
    return formatter.format(date);
  }

  static DateTime parse(String date, String pattern, [String? local]) {
    String? currentLocal = local;
    // if (local == null) currentLocal = AppProvider().getLanguageCode;
    final formatter = DateFormat(pattern, currentLocal);
    return formatter.parse(date);
  }
}
