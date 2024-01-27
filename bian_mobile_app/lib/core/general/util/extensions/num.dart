import 'dart:math';

import '../../theme/theme.dart';
import '../util.dart';

extension ParseNumToFormattedCurrency on num {
  String toCurrency() {
    return thousandsNumber(toString());
  }
}

extension ParseNumberThousandsNumber on num {
  String toThousandsNumber(
      {bool brackets = false, bool bracketsIfMinus = false}) {
    String value = thousandsNumber(toString());
    if (bracketsIfMinus) {
      if (this < 0) {
        value = '($value)';
      }
    }
    value = brackets ? '($value)' : value;
    return value;
  }

  String toStringOrSymbolIfZero({String symbol = ''}) {
    try {
      String value = toString();
      if (value.isEmpty || value == '0') {
        return symbol;
      } else {
        return value;
      }
    } catch (e) {
      return symbol;
    }
  }

  String get toMinutesAndSeconds {
    int minutes = (this / 60).floor();
    int seconds = (this % 60).floor();
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}

extension Stringify on num? {
  String get toStringWithLeading0OrEmpty {
    if (this == null) {
      return "";
    }
    try {
      final asString = toString();
      if (asString.length <= 1) {
        return "0$asString";
      }
      return asString;
    } catch (e) {
      return '';
    }
  }

  String get toStringOrEmpty {
    if (this == null) {
      return "";
    }
    return toString();
    // try {
    // } catch (e) {
    //   return '';
    // }
  }

  String get toStringOrZero {
    if (this == null) {
      return "0";
    }
    try {
      return toString();
    } catch (e) {
      return '';
    }
  }

  String toStringOrSymbol([String symbol = "-"]) {
    if (this == null) {
      return symbol;
    }
    try {
      return toStringWithLeading0OrEmpty;
    } catch (e) {
      return symbol;
    }
  }

  String toStringOrSymbolIfZero({String symbol = ''}) {
    try {
      String value = toString();
      if (value.isEmpty || value == '0') {
        return symbol;
      } else {
        return value;
      }
    } catch (e) {
      return symbol;
    }
  }
}

extension CustomSizeExtension on num {
  /// get larger value form h or w
  double get l => max(h, w);
}

extension NullableNumExtension on num? {
  num get orOne {
    if (this == null) {
      return 1;
    } else {
      return this!;
    }
  }

  num get orZero {
    if (this == null) {
      return 0;
    } else {
      return this!;
    }
  }

  num get zeroIfNegative {
    if (this == null || this! < 0) {
      return 0;
    }
    return this!;
  }
}
