import 'package:collection/collection.dart';

import 'package:intl/intl.dart';

export 'package:intl/intl.dart' show DateFormat, NumberFormat;
export 'package:time/time.dart';

bool Function(dynamic e1, dynamic e2) deepListEquals =
    const DeepCollectionEquality().equals;
bool Function(List<dynamic>? list1, List<dynamic>? list2) listEquals =
    const ListEquality().equals;

String formatDate(String date) {
  return DateFormat('yyyy-MM-dd').format(DateTime.parse(date));
}

DateTime stringToDateTime(String date, {bool withTime = true}) {
  if (withTime) {
    return DateTime.parse(date);
  }
  return DateFormat('yyyy-MM-dd').parse(date);
}

/// get the date with time in 12 hour format and with morning/evening
String getDateWithTime12HourMorningOrEvening(DateTime date,
    {bool justTime = false, bool justMeridian = false}) {
  var hour = date.hour;
  var minute = date.minute;
  var meridian = hour < 12 ? "AM" : "PM";
  // var meridian = hour < 12 ? t.am : t.pm;
  var hour12 = hour % 12 == 0 ? 12 : hour % 12;
  var time = '$hour12:$minute $meridian';
  if (justTime) {
    return time;
  }
  if (justMeridian) {
    return meridian;
  }
  return '${DateFormat('yyyy-MM-dd').format(date)} - $time';
}

// // time format for display in the app
// String dateFormatForDisplay(String date) {
//   var now = DateTime.now();
//   var dateTime = DateTime.parse(date);
//   var diff = now.difference(dateTime);
//   var diffInDays = diff.inDays;
//   if (diffInDays == 0) {
//     return 'اليوم';
//   } else if (diffInDays == 1) {
//     return 'أمس';
//   } else {
//     return '${formatDate(date)}';
//   }
// }

String convertToAgo(DateTime input) {
  Duration diff = DateTime.now().difference(input);

  if (diff.inDays >= 1) {
    return '${diff.inDays} day(s) ago';
  } else if (diff.inHours >= 1) {
    return '${diff.inHours} hour(s) ago';
  } else if (diff.inMinutes >= 1) {
    return '${diff.inMinutes} minute(s) ago';
  } else if (diff.inSeconds >= 1) {
    return '${diff.inSeconds} second(s) ago';
  } else {
    return 'just now';
  }
}

int differenceInDays(DateTime start, DateTime end) {
  var diff = end.difference(start);
  return diff.inDays;
}

int differenceInHours(DateTime start, DateTime end) {
  var diff = end.difference(start);
  return diff.inHours % 60;
}

int differenceInMinutes(DateTime start, DateTime end) {
  var diff = end.difference(start);
  return diff.inMinutes % 60;
}

String dateFormatForDisplay(DateTime dateTime,
    {bool showTimeIfToday = false,
    bool showHoursAgoIfToday = false,
    bool showMinutesAgoIfToday = false}) {
  String formattedDate = '';
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final yesterday = DateTime(now.year, now.month, now.day - 1);
  final aDate = DateTime(dateTime.year, dateTime.month, dateTime.day);
  if (aDate == today) {
    int diffHours = differenceInHours(dateTime, now);
    int diffMinutes = differenceInMinutes(dateTime, now);

    if (showHoursAgoIfToday || showMinutesAgoIfToday) {
      if (diffMinutes < 60 && showMinutesAgoIfToday) {
        formattedDate = "ago" ' ' "minutes ago";
      } else {
        formattedDate = "ago" ' ' "hours ago";
      }
    } else if (showTimeIfToday) {
      var formatter = DateFormat.jm();
      formattedDate = formatter.format(dateTime);
    } else {
      return "today";
    }
  } else if (aDate == yesterday) {
    formattedDate = "yesterday";
  } else {
    var formatter = DateFormat('yyyy/MM/dd');
    formattedDate = formatter.format(dateTime);
  }

  return formattedDate;
}

get thousandsNumberRegExp => RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');

String thousandsNumber(String number) {
  return number.replaceAllMapped(
      thousandsNumberRegExp, (Match m) => '${m[1]},');
}

final DateTime emptyDateTime = DateTime(1900, 1, 1);
const String emptyString = "";
const num emptyNum = 0;
const int emptyInt = 0;
const double emptyDouble = 0.0;
const bool emptyBool = false;
final List emptyList = [];
