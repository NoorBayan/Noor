import '../../helpers/date_format_helper.dart';
import '../../providers/app_provider.dart';
import '../util.dart';

extension ParseDateTime on DateTime {
  String formatDate({String? symbol}) {
    String _symbol = symbol ?? '/';
    return DateFormat('yyyy${_symbol}MM${_symbol}dd').format(this);
  }

  String get formatDateTimeMorningOrEvening {
    return getDateWithTime12HourMorningOrEvening(this);
  }


  String format(String format, [String? local]) {
    return DateFormatHelper.format(this, format, local);
  }

  String get localizedMonthCustomFormat {
    final month = format("MMMM",);
    final year = format("yyyy");
    return "$month , $year";
  }

  DateTime get justDate {
    return DateTime(year, month, day);
  }

  String get justTime {
    return getDateWithTime12HourMorningOrEvening(this, justTime: true);
  } 
  String get justMeridian {
    return getDateWithTime12HourMorningOrEvening(this, justMeridian: true);
  }

  bool isSameDay(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  bool isDateInRange(DateTime start, DateTime end) {
    return isAfter(start) && isBefore(end);
  }
}
